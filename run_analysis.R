##==1.Merges the training and the test sets to create one data set.======================

packages <- c("data.table", "reshape2")
sapply(packages, require, character.only = TRUE, quietly = TRUE)
## Load Multiple Package

## Use this code if working on my Main R Directory
##setwd(paste(getwd(),"/Getting and Cleaning Data",sep=""))

## download url into file.path
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
file<-"Dataset.zip"
download.file(url,file.path(getwd(),file))


## set command to execute winrar on the zip file
winrar<-"C:/Program Files/WinRAR/WinRAR.exe"
## Location of winRAR

cmd <- paste(paste0("\"", winrar, "\""), "x", paste0("\"", file.path(getwd(),file),"\""))

             
system(cmd)
## execute command

unzipfolder<-file.path(getwd(),"UCI HAR Dataset")

##Read subject and activity
subjecttrain<-fread(file.path(unzipfolder,"train","subject_train.txt"))
subjecttest<-fread(file.path(unzipfolder,"test","subject_test.txt"))
acctrain<-fread(file.path(unzipfolder,"train","Y_train.txt"))
acctest<-fread(file.path(unzipfolder,"test","Y_test.txt"))

##Read x table
xtrain<-data.table(read.table(file.path(unzipfolder,"train","X_train.txt")))
xtest<-data.table(read.table(file.path(unzipfolder,"test","X_test.txt")))

##Combine subject and activity
subjectbind<-rbind(subjecttrain,subjecttest)
activitybind<-rbind(acctrain,acctest)
setnames(subjectbind,"V1","subject")
setnames(activitybind,"V1","activitynumber")

##Combine x table
xbind<-rbind(xtrain,xtest)

##Combine column all
allbind<-cbind(subjectbind,activitybind,xbind)

#Sort allbind by subject, then by activity number
setkey(allbind,subject,activitynumber)

##Set feature to find mean & sd
features<-fread(file.path(unzipfolder,"features.txt"))
setnames(features,names(features),c("featurenumber","featurename"))

##==2.Extracts only the measurements on the mean and standard deviation for each measurement.======================
##Classify feature that contain only mean() and std(). Set it as feature2
features2<-features[grepl("mean\\(\\)|std\\(\\)",featurename)]
features2$vfeaturenumber<-features2[,paste0("V",featurenumber)]

##Select column to be used; subject, activity number, and "selected" feature
select<-c(key(allbind),features2$vfeaturenumber)
## with=FALSE is important. Without it, it will return select vector
allbind2<-allbind[,select,with=FALSE]

##Read activity label
activitylabels<-fread(file.path(unzipfolder,"activity_labels.txt"))
setnames(activitylabels,names(activitylabels),c("activitynumber","activityname"))

##Add activity label to allbind3 through the use of merge function
## That is; allbind3 will be "selected" feature plus suject, activity number, and ,activity label
allbind3<-merge(allbind2,activitylabels,by="activitynumber",all.X=TRUE)

##Sort again
setkey(allbind3,subject,activitynumber,activityname)

##Reshape data by taking x variable and spread out in vfeaturenumber column. Leave the rest of data; subject, activitynumber, and activityname the same
allbind4<-data.table(melt(allbind3,key(allbind3),variable.name="vfeaturenumber"))

##==3.Uses descriptive activity names to name the activities in the data set======================
##Add featurename and featurenumber to allbind4
allbind5<-merge(allbind4,features2[,list(featurenumber,vfeaturenumber,featurename)],by="vfeaturenumber",all.x=TRUE)

##add activity and feature column
allbind5$activity<-factor(allbind5$activityname)
allbind5$feature<-factor(allbind5$featurename)

##==4.Appropriately labels the data set with descriptive variable names.======================
## classify whether it is time variable or frequency variable
n<-2
y<-matrix(seq(1, n), nrow = n)
x<-matrix(c(grepl("^t",allbind5$feature), grepl("^f",allbind5$feature)),ncol=nrow(y))
## Time variable will be displayed for value of 1 while Freq will be displayed for value of 2
allbind5$Domain<-factor(x%*%y,labels=c("Time","Freq"))

##Classify between Type of sensor signal
x<-matrix(c(grepl("Acc",allbind5$feature), grepl("Gyro",allbind5$feature)),ncol=nrow(y))
allbind5$Instrument<-factor(x%*%y,labels=c("Accelerometer","Gyroscope"))

##Classify component of sensor acceleration signal, which are gravitational and body motion components
x<-matrix(c(grepl("BodyAcc",allbind5$feature), grepl("GravityAcc",allbind5$feature)),ncol=nrow(y))
## Note that, if the information factor has NA, label will be start at NA
allbind5$Acceleration<-factor(x%*%y,labels=c(NA,"Body","Gravity"))

##Classify between mean and sd
x<-matrix(c(grepl("mean()",allbind5$feature),grepl("std()",allbind5$feature)),ncol=nrow(y))
allbind5$Variable<-factor(x%*%y,labels=c("Mean","SD"))

## From unique(allbind5$feature), there is jerk signal and magnitude of three dimensional signal
allbind5$Jerk<-factor(grepl("Jerk",allbind5$feature),labels=c(NA,"Jerk"))
allbind5$Magnitude<-factor(grepl("Mag",allbind5$feature),labels=c(NA,"Magnitude"))
## Classify -x, -y, -z, the 3-axial signals
n<-3
y<-matrix(seq(1,n),nrow=n)
x<-matrix(c(grepl("-X",allbind5$feature),grepl("-Y",allbind5$feature), grepl("-Z",allbind5$feature)),ncol=nrow(y))
allbind5$Axis<-factor(x%*%y,labels=c(NA,"X","Y","Z"))

##Make sure that all feature are counted. Note that there are 66 unique feature in this dataset.
##.N will count the number of rows in the group.
r1 <- nrow(allbind5[, .N, by = c("feature")])
r2 <- nrow(allbind5[, .N, by = c("Domain","Acceleration","Instrument","Jerk","Magnitude","Variable","Axis")])
r1 == r2

##==5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.===========
##Create a data set with the average of each variable for each activity and each subject.
setkey(allbind5,subject,activity,Domain,Acceleration,Instrument,Jerk,Magnitude,Variable,Axis)
##Cal average separated by 30 subjects,6 Activity, and different 666 factors
allbind5tidy<-allbind5[,list(count=.N,average=mean(value)),by =key(allbind5)]

##Create tidy file
write.csv(allbind5,file="allbind5.csv")
write.csv(allbind5tidy,file="allbind5tidy.csv")

write.table(allbind5tidy,file="allbind5tidy.txt",row.names=FALSE)

##Make codebook.
library(rmarkdown)
render("CODEBOOK.Rmd",output_format="md_document")
render("CODEBOOK.Rmd")

##Make markdown
render("README.Rmd",output_format="md_document")
render("README.Rmd")
