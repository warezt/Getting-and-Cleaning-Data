This is a code book
-------------------

### The result from **run\_analysis.R** is intended to answer five questions below

------------------------------------------------------------------------

You should create one R script called run\_analysis.R that does the
following.  
1.Merges the training and the test sets to create one data set.  
2.Extracts only the measurements on the mean and standard deviation for
each measurement.  
3.Uses descriptive activity names to name the activities in the data
set  
4.Appropriately labels the data set with descriptive variable names.  
5.From the data set in step 4, creates a second, independent tidy data
set with the average of each variable for each activity and each
subject.

#### As a result **run\_analysis.R** will create the following result

<table>
<thead>
<tr class="header">
<th>Name</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>allbind5</td>
<td>data.table</td>
<td>Result from first four question</td>
</tr>
<tr class="even">
<td>allbind5tidy</td>
<td>data.table</td>
<td>Result from fifth question</td>
</tr>
<tr class="odd">
<td>allbind5.csv</td>
<td>csv file</td>
<td>Conversion of allbind5</td>
</tr>
<tr class="even">
<td>allbind5tidy.csv</td>
<td>csv file</td>
<td>Conversion of allbind5tidy</td>
</tr>
<tr class="odd">
<td>allbind5tidy.txt</td>
<td>txt file</td>
<td>Conversion of allbind5tidy</td>
</tr>
</tbody>
</table>

### For **allbind5** variable detail are listed as follows

**- vfeaturenumber**  
The mean and sd measurement for each of factor for using in this
analysis. Displayed as variable code.  
**- subject**  
group of 30 volunteers within an age bracket of 19-48 years  
**- activitynumber**  
list of six activities (1=WALKING, 2=WALKING\_UPSTAIRS,
3=WALKING\_DOWNSTAIRS, 4=SITTING, 5=STANDING, 6=LAYING)  
**- activityname & activity**  
Activity name; WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING,
STANDING, and LAYING  
**- value**  
Single value of each sample. The value is corespond to featurename.  
**- featurenumber**  
Same as vfeaturenumber. Except that there is no v as a code for
mapping  
**- featurename**  
detailed featurename.  
**- Domain**  
Time and frequency notation  
**- Instrument**  
Type of sensor signal  
**- Variable**  
Classify between mean and sd  
**- Jerk**  
jerk signal and magnitude of three dimensional signal  
**- Magnitude**  
Magnitude of three dimensional signal  
**- Axis**  
Classify -x, -y, -z, the 3-axial signals  
**- Count**  
Number count of each variable in calculating average  
**- Average**  
Average value based on each variable.

Information from **allbind5** data.table
----------------------------------------

    library("memisc")

    ## Loading required package: lattice

    ## Loading required package: MASS

    ## 
    ## Attaching package: 'memisc'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     contr.sum, contr.treatment, contrasts

    ## The following object is masked from 'package:base':
    ## 
    ##     as.array

    codebook(allbind5)

    ## ===========================================================================
    ## 
    ##    vfeaturenumber
    ## 
    ## ---------------------------------------------------------------------------
    ## 
    ##    Storage mode: character
    ## 
    ##        Length:     679734
    ##         Class:  character
    ##          Mode:  character
    ## 
    ## ===========================================================================
    ## 
    ##    subject
    ## 
    ## ---------------------------------------------------------------------------
    ## 
    ##    Storage mode: integer
    ## 
    ##           Min.:   1.000
    ##        1st Qu.:   9.000
    ##         Median:  17.000
    ##           Mean:  16.150
    ##        3rd Qu.:  24.000
    ##           Max.:  30.000
    ## 
    ## ===========================================================================
    ## 
    ##    activitynumber
    ## 
    ## ---------------------------------------------------------------------------
    ## 
    ##    Storage mode: integer
    ## 
    ##           Min.:  1.000
    ##        1st Qu.:  2.000
    ##         Median:  4.000
    ##           Mean:  3.625
    ##        3rd Qu.:  5.000
    ##           Max.:  6.000
    ## 
    ## ===========================================================================
    ## 
    ##    activityname
    ## 
    ## ---------------------------------------------------------------------------
    ## 
    ##    Storage mode: character
    ## 
    ##        Length:     679734
    ##         Class:  character
    ##          Mode:  character
    ## 
    ## ===========================================================================
    ## 
    ##    value
    ## 
    ## ---------------------------------------------------------------------------
    ## 
    ##    Storage mode: double
    ## 
    ##           Min.:  -1.000
    ##        1st Qu.:  -0.981
    ##         Median:  -0.552
    ##           Mean:  -0.511
    ##        3rd Qu.:  -0.100
    ##           Max.:   1.000
    ## 
    ## ===========================================================================
    ## 
    ##    featurenumber
    ## 
    ## ---------------------------------------------------------------------------
    ## 
    ##    Storage mode: integer
    ## 
    ##           Min.:    1.000
    ##        1st Qu.:   85.000
    ##         Median:  214.500
    ##           Mean:  230.600
    ##        3rd Qu.:  348.000
    ##           Max.:  543.000
    ## 
    ## ===========================================================================
    ## 
    ##    featurename
    ## 
    ## ---------------------------------------------------------------------------
    ## 
    ##    Storage mode: character
    ## 
    ##        Length:     679734
    ##         Class:  character
    ##          Mode:  character
    ## 
    ## ===========================================================================
    ## 
    ##    activity
    ## 
    ## ---------------------------------------------------------------------------
    ## 
    ##    Storage mode: integer
    ##    Factor with 6 levels
    ## 
    ##         Values and labels      N      Percent   
    ##                                                 
    ##    1 'LAYING'             128304     18.9       
    ##    2 'SITTING'            117282     17.3       
    ##    3 'STANDING'           125796     18.5       
    ##    4 'WALKING'            113652     16.7       
    ##    5 'WALKING_DOWNSTAIRS'  92796     13.7       
    ##    6 'WALKING_UPSTAIRS'   101904     15.0       
    ## 
    ## ===========================================================================
    ## 
    ##    feature
    ## 
    ## ---------------------------------------------------------------------------
    ## 
    ##    Storage mode: integer
    ##    Factor with 66 levels
    ## 
    ##                   Values and labels     N     Percent  
    ##                                                        
    ##     1 'fBodyAcc-mean()-X'           10299     1.5      
    ##     2 'fBodyAcc-mean()-Y'           10299     1.5      
    ##     3 'fBodyAcc-mean()-Z'           10299     1.5      
    ##     4 'fBodyAcc-std()-X'            10299     1.5      
    ##     5 'fBodyAcc-std()-Y'            10299     1.5      
    ##     6 'fBodyAcc-std()-Z'            10299     1.5      
    ##     7 'fBodyAccJerk-mean()-X'       10299     1.5      
    ##     8 'fBodyAccJerk-mean()-Y'       10299     1.5      
    ##     9 'fBodyAccJerk-mean()-Z'       10299     1.5      
    ##    10 'fBodyAccJerk-std()-X'        10299     1.5      
    ##    11 'fBodyAccJerk-std()-Y'        10299     1.5      
    ##    12 'fBodyAccJerk-std()-Z'        10299     1.5      
    ##    13 'fBodyAccMag-mean()'          10299     1.5      
    ##    14 'fBodyAccMag-std()'           10299     1.5      
    ##    15 'fBodyBodyAccJerkMag-mean()'  10299     1.5      
    ##    16 'fBodyBodyAccJerkMag-std()'   10299     1.5      
    ##    17 'fBodyBodyGyroJerkMag-mean()' 10299     1.5      
    ##    18 'fBodyBodyGyroJerkMag-std()'  10299     1.5      
    ##    19 'fBodyBodyGyroMag-mean()'     10299     1.5      
    ##    20 'fBodyBodyGyroMag-std()'      10299     1.5      
    ##    21 'fBodyGyro-mean()-X'          10299     1.5      
    ##    22 'fBodyGyro-mean()-Y'          10299     1.5      
    ##    23 'fBodyGyro-mean()-Z'          10299     1.5      
    ##    24 'fBodyGyro-std()-X'           10299     1.5      
    ##    25 'fBodyGyro-std()-Y'           10299     1.5      
    ##    26 'fBodyGyro-std()-Z'           10299     1.5      
    ##    27 'tBodyAcc-mean()-X'           10299     1.5      
    ##    28 'tBodyAcc-mean()-Y'           10299     1.5      
    ##    29 'tBodyAcc-mean()-Z'           10299     1.5      
    ##    30 'tBodyAcc-std()-X'            10299     1.5      
    ##    31 'tBodyAcc-std()-Y'            10299     1.5      
    ##    32 'tBodyAcc-std()-Z'            10299     1.5      
    ##    33 'tBodyAccJerk-mean()-X'       10299     1.5      
    ##    34 'tBodyAccJerk-mean()-Y'       10299     1.5      
    ##    35 'tBodyAccJerk-mean()-Z'       10299     1.5      
    ##    36 'tBodyAccJerk-std()-X'        10299     1.5      
    ##    37 'tBodyAccJerk-std()-Y'        10299     1.5      
    ##    38 'tBodyAccJerk-std()-Z'        10299     1.5      
    ##    39 'tBodyAccJerkMag-mean()'      10299     1.5      
    ##    40 'tBodyAccJerkMag-std()'       10299     1.5      
    ##    41 'tBodyAccMag-mean()'          10299     1.5      
    ##    42 'tBodyAccMag-std()'           10299     1.5      
    ##    43 'tBodyGyro-mean()-X'          10299     1.5      
    ##    44 'tBodyGyro-mean()-Y'          10299     1.5      
    ##    45 'tBodyGyro-mean()-Z'          10299     1.5      
    ##    46 'tBodyGyro-std()-X'           10299     1.5      
    ##    47 'tBodyGyro-std()-Y'           10299     1.5      
    ##    48 'tBodyGyro-std()-Z'           10299     1.5      
    ##    49 'tBodyGyroJerk-mean()-X'      10299     1.5      
    ##    50 'tBodyGyroJerk-mean()-Y'      10299     1.5      
    ##    51 'tBodyGyroJerk-mean()-Z'      10299     1.5      
    ##    52 'tBodyGyroJerk-std()-X'       10299     1.5      
    ##    53 'tBodyGyroJerk-std()-Y'       10299     1.5      
    ##    54 'tBodyGyroJerk-std()-Z'       10299     1.5      
    ##    55 'tBodyGyroJerkMag-mean()'     10299     1.5      
    ##    56 'tBodyGyroJerkMag-std()'      10299     1.5      
    ##    57 'tBodyGyroMag-mean()'         10299     1.5      
    ##    58 'tBodyGyroMag-std()'          10299     1.5      
    ##    59 'tGravityAcc-mean()-X'        10299     1.5      
    ##    60 'tGravityAcc-mean()-Y'        10299     1.5      
    ##    61 'tGravityAcc-mean()-Z'        10299     1.5      
    ##    62 'tGravityAcc-std()-X'         10299     1.5      
    ##    63 'tGravityAcc-std()-Y'         10299     1.5      
    ##    64 'tGravityAcc-std()-Z'         10299     1.5      
    ##    65 'tGravityAccMag-mean()'       10299     1.5      
    ##    66 'tGravityAccMag-std()'        10299     1.5      
    ## 
    ## ===========================================================================
    ## 
    ##    Domain
    ## 
    ## ---------------------------------------------------------------------------
    ## 
    ##    Storage mode: integer
    ##    Factor with 2 levels
    ## 
    ##    Values and labels      N      Percent   
    ##                                            
    ##             1 'Time' 411960     60.6       
    ##             2 'Freq' 267774     39.4       
    ## 
    ## ===========================================================================
    ## 
    ##    Instrument
    ## 
    ## ---------------------------------------------------------------------------
    ## 
    ##    Storage mode: integer
    ##    Factor with 2 levels
    ## 
    ##    Values and labels      N      Percent   
    ##                                            
    ##    1 'Accelerometer' 411960     60.6       
    ##    2 'Gyroscope'     267774     39.4       
    ## 
    ## ===========================================================================
    ## 
    ##    Acceleration
    ## 
    ## ---------------------------------------------------------------------------
    ## 
    ##    Storage mode: integer
    ##    Factor with 3 levels
    ## 
    ##    Values and labels      N      Percent   
    ##                                            
    ##          1 'NA'      267774     39.4       
    ##          2 'Body'    329568     48.5       
    ##          3 'Gravity'  82392     12.1       
    ## 
    ## ===========================================================================
    ## 
    ##    Variable
    ## 
    ## ---------------------------------------------------------------------------
    ## 
    ##    Storage mode: integer
    ##    Factor with 2 levels
    ## 
    ##    Values and labels      N      Percent   
    ##                                            
    ##             1 'Mean' 339867     50.0       
    ##             2 'SD'   339867     50.0       
    ## 
    ## ===========================================================================
    ## 
    ##    Jerk
    ## 
    ## ---------------------------------------------------------------------------
    ## 
    ##    Storage mode: integer
    ##    Factor with 2 levels
    ## 
    ##    Values and labels      N      Percent   
    ##                                            
    ##             1 'NA'   411960     60.6       
    ##             2 'Jerk' 267774     39.4       
    ## 
    ## ===========================================================================
    ## 
    ##    Magnitude
    ## 
    ## ---------------------------------------------------------------------------
    ## 
    ##    Storage mode: integer
    ##    Factor with 2 levels
    ## 
    ##    Values and labels      N      Percent   
    ##                                            
    ##        1 'NA'        494352     72.7       
    ##        2 'Magnitude' 185382     27.3       
    ## 
    ## ===========================================================================
    ## 
    ##    Axis
    ## 
    ## ---------------------------------------------------------------------------
    ## 
    ##    Storage mode: integer
    ##    Factor with 4 levels
    ## 
    ##    Values and labels      N      Percent   
    ##                                            
    ##               1 'NA' 185382     27.3       
    ##               2 'X'  164784     24.2       
    ##               3 'Y'  164784     24.2       
    ##               4 'Z'  164784     24.2

    str(allbind5)

    ## Classes 'data.table' and 'data.frame':   679734 obs. of  16 variables:
    ##  $ vfeaturenumber: chr  "V121" "V121" "V121" "V121" ...
    ##  $ subject       : int  1 1 1 1 1 1 1 1 1 1 ...
    ##  $ activitynumber: int  6 6 6 6 6 6 6 6 6 6 ...
    ##  $ activityname  : chr  "LAYING" "LAYING" "LAYING" "LAYING" ...
    ##  $ value         : num  0.03155 0.00926 -0.01342 -0.02496 -0.02955 ...
    ##  $ featurenumber : int  121 121 121 121 121 121 121 121 121 121 ...
    ##  $ featurename   : chr  "tBodyGyro-mean()-X" "tBodyGyro-mean()-X" "tBodyGyro-mean()-X" "tBodyGyro-mean()-X" ...
    ##  $ activity      : Factor w/ 6 levels "LAYING","SITTING",..: 1 1 1 1 1 1 1 1 1 1 ...
    ##  $ feature       : Factor w/ 66 levels "fBodyAcc-mean()-X",..: 43 43 43 43 43 43 43 43 43 43 ...
    ##  $ Domain        : Factor w/ 2 levels "Time","Freq": 1 1 1 1 1 1 1 1 1 1 ...
    ##  $ Instrument    : Factor w/ 2 levels "Accelerometer",..: 2 2 2 2 2 2 2 2 2 2 ...
    ##  $ Acceleration  : Factor w/ 3 levels NA,"Body","Gravity": 1 1 1 1 1 1 1 1 1 1 ...
    ##  $ Variable      : Factor w/ 2 levels "Mean","SD": 1 1 1 1 1 1 1 1 1 1 ...
    ##  $ Jerk          : Factor w/ 2 levels NA,"Jerk": 1 1 1 1 1 1 1 1 1 1 ...
    ##  $ Magnitude     : Factor w/ 2 levels NA,"Magnitude": 1 1 1 1 1 1 1 1 1 1 ...
    ##  $ Axis          : Factor w/ 4 levels NA,"X","Y","Z": 2 2 2 2 2 2 2 2 2 2 ...
    ##  - attr(*, ".internal.selfref")=<externalptr> 
    ##  - attr(*, "sorted")= chr  "subject" "activity" "Domain" "Acceleration" ...

    summary(allbind5)

    ##  vfeaturenumber        subject      activitynumber  activityname      
    ##  Length:679734      Min.   : 1.00   Min.   :1.000   Length:679734     
    ##  Class :character   1st Qu.: 9.00   1st Qu.:2.000   Class :character  
    ##  Mode  :character   Median :17.00   Median :4.000   Mode  :character  
    ##                     Mean   :16.15   Mean   :3.625                     
    ##                     3rd Qu.:24.00   3rd Qu.:5.000                     
    ##                     Max.   :30.00   Max.   :6.000                     
    ##                                                                       
    ##      value          featurenumber   featurename       
    ##  Min.   :-1.00000   Min.   :  1.0   Length:679734     
    ##  1st Qu.:-0.98122   1st Qu.: 85.0   Class :character  
    ##  Median :-0.55219   Median :214.5   Mode  :character  
    ##  Mean   :-0.51134   Mean   :230.6                     
    ##  3rd Qu.:-0.09971   3rd Qu.:348.0                     
    ##  Max.   : 1.00000   Max.   :543.0                     
    ##                                                       
    ##                activity                   feature        Domain      
    ##  LAYING            :128304   fBodyAcc-mean()-X: 10299   Time:411960  
    ##  SITTING           :117282   fBodyAcc-mean()-Y: 10299   Freq:267774  
    ##  STANDING          :125796   fBodyAcc-mean()-Z: 10299                
    ##  WALKING           :113652   fBodyAcc-std()-X : 10299                
    ##  WALKING_DOWNSTAIRS: 92796   fBodyAcc-std()-Y : 10299                
    ##  WALKING_UPSTAIRS  :101904   fBodyAcc-std()-Z : 10299                
    ##                              (Other)          :617940                
    ##          Instrument      Acceleration    Variable        Jerk       
    ##  Accelerometer:411960   NA     :267774   Mean:339867   NA  :411960  
    ##  Gyroscope    :267774   Body   :329568   SD  :339867   Jerk:267774  
    ##                         Gravity: 82392                              
    ##                                                                     
    ##                                                                     
    ##                                                                     
    ##                                                                     
    ##      Magnitude      Axis       
    ##  NA       :494352   NA:185382  
    ##  Magnitude:185382   X :164784  
    ##                     Y :164784  
    ##                     Z :164784  
    ##                                
    ##                                
    ## 

Information from **allbind5tidy** data.table
--------------------------------------------

    codebook(allbind5tidy)

    ## ===========================================================================
    ## 
    ##    subject
    ## 
    ## ---------------------------------------------------------------------------
    ## 
    ##    Storage mode: integer
    ## 
    ##           Min.:   1.000
    ##        1st Qu.:   8.000
    ##         Median:  15.500
    ##           Mean:  15.500
    ##        3rd Qu.:  23.000
    ##           Max.:  30.000
    ## 
    ## ===========================================================================
    ## 
    ##    activity
    ## 
    ## ---------------------------------------------------------------------------
    ## 
    ##    Storage mode: integer
    ##    Factor with 6 levels
    ## 
    ##         Values and labels    N    Percent 
    ##                                           
    ##    1 'LAYING'             1980   16.7     
    ##    2 'SITTING'            1980   16.7     
    ##    3 'STANDING'           1980   16.7     
    ##    4 'WALKING'            1980   16.7     
    ##    5 'WALKING_DOWNSTAIRS' 1980   16.7     
    ##    6 'WALKING_UPSTAIRS'   1980   16.7     
    ## 
    ## ===========================================================================
    ## 
    ##    Domain
    ## 
    ## ---------------------------------------------------------------------------
    ## 
    ##    Storage mode: integer
    ##    Factor with 2 levels
    ## 
    ##    Values and labels    N    Percent 
    ##                                      
    ##             1 'Time' 7200   60.6     
    ##             2 'Freq' 4680   39.4     
    ## 
    ## ===========================================================================
    ## 
    ##    Acceleration
    ## 
    ## ---------------------------------------------------------------------------
    ## 
    ##    Storage mode: integer
    ##    Factor with 3 levels
    ## 
    ##    Values and labels    N    Percent 
    ##                                      
    ##          1 'NA'      4680   39.4     
    ##          2 'Body'    5760   48.5     
    ##          3 'Gravity' 1440   12.1     
    ## 
    ## ===========================================================================
    ## 
    ##    Instrument
    ## 
    ## ---------------------------------------------------------------------------
    ## 
    ##    Storage mode: integer
    ##    Factor with 2 levels
    ## 
    ##    Values and labels    N    Percent 
    ##                                      
    ##    1 'Accelerometer' 7200   60.6     
    ##    2 'Gyroscope'     4680   39.4     
    ## 
    ## ===========================================================================
    ## 
    ##    Jerk
    ## 
    ## ---------------------------------------------------------------------------
    ## 
    ##    Storage mode: integer
    ##    Factor with 2 levels
    ## 
    ##    Values and labels    N    Percent 
    ##                                      
    ##             1 'NA'   7200   60.6     
    ##             2 'Jerk' 4680   39.4     
    ## 
    ## ===========================================================================
    ## 
    ##    Magnitude
    ## 
    ## ---------------------------------------------------------------------------
    ## 
    ##    Storage mode: integer
    ##    Factor with 2 levels
    ## 
    ##    Values and labels    N    Percent 
    ##                                      
    ##        1 'NA'        8640   72.7     
    ##        2 'Magnitude' 3240   27.3     
    ## 
    ## ===========================================================================
    ## 
    ##    Variable
    ## 
    ## ---------------------------------------------------------------------------
    ## 
    ##    Storage mode: integer
    ##    Factor with 2 levels
    ## 
    ##    Values and labels    N    Percent 
    ##                                      
    ##             1 'Mean' 5940   50.0     
    ##             2 'SD'   5940   50.0     
    ## 
    ## ===========================================================================
    ## 
    ##    Axis
    ## 
    ## ---------------------------------------------------------------------------
    ## 
    ##    Storage mode: integer
    ##    Factor with 4 levels
    ## 
    ##    Values and labels    N    Percent 
    ##                                      
    ##               1 'NA' 3240   27.3     
    ##               2 'X'  2880   24.2     
    ##               3 'Y'  2880   24.2     
    ##               4 'Z'  2880   24.2     
    ## 
    ## ===========================================================================
    ## 
    ##    count
    ## 
    ## ---------------------------------------------------------------------------
    ## 
    ##    Storage mode: integer
    ## 
    ##           Min.:  36.000
    ##        1st Qu.:  49.000
    ##         Median:  54.500
    ##           Mean:  57.220
    ##        3rd Qu.:  63.250
    ##           Max.:  95.000
    ## 
    ## ===========================================================================
    ## 
    ##    average
    ## 
    ## ---------------------------------------------------------------------------
    ## 
    ##    Storage mode: double
    ## 
    ##           Min.:  -0.998
    ##        1st Qu.:  -0.962
    ##         Median:  -0.470
    ##           Mean:  -0.484
    ##        3rd Qu.:  -0.078
    ##           Max.:   0.975

    str(allbind5tidy)

    ## Classes 'data.table' and 'data.frame':   11880 obs. of  11 variables:
    ##  $ subject     : int  1 1 1 1 1 1 1 1 1 1 ...
    ##  $ activity    : Factor w/ 6 levels "LAYING","SITTING",..: 1 1 1 1 1 1 1 1 1 1 ...
    ##  $ Domain      : Factor w/ 2 levels "Time","Freq": 1 1 1 1 1 1 1 1 1 1 ...
    ##  $ Acceleration: Factor w/ 3 levels NA,"Body","Gravity": 1 1 1 1 1 1 1 1 1 1 ...
    ##  $ Instrument  : Factor w/ 2 levels "Accelerometer",..: 2 2 2 2 2 2 2 2 2 2 ...
    ##  $ Jerk        : Factor w/ 2 levels NA,"Jerk": 1 1 1 1 1 1 1 1 2 2 ...
    ##  $ Magnitude   : Factor w/ 2 levels NA,"Magnitude": 1 1 1 1 1 1 2 2 1 1 ...
    ##  $ Variable    : Factor w/ 2 levels "Mean","SD": 1 1 1 2 2 2 1 2 1 1 ...
    ##  $ Axis        : Factor w/ 4 levels NA,"X","Y","Z": 2 3 4 2 3 4 1 1 2 3 ...
    ##  $ count       : int  50 50 50 50 50 50 50 50 50 50 ...
    ##  $ average     : num  -0.0166 -0.0645 0.1487 -0.8735 -0.9511 ...
    ##  - attr(*, "sorted")= chr  "subject" "activity" "Domain" "Acceleration" ...
    ##  - attr(*, ".internal.selfref")=<externalptr>

    summary(allbind5tidy)

    ##     subject                   activity     Domain      Acceleration 
    ##  Min.   : 1.0   LAYING            :1980   Time:7200   NA     :4680  
    ##  1st Qu.: 8.0   SITTING           :1980   Freq:4680   Body   :5760  
    ##  Median :15.5   STANDING          :1980               Gravity:1440  
    ##  Mean   :15.5   WALKING           :1980                             
    ##  3rd Qu.:23.0   WALKING_DOWNSTAIRS:1980                             
    ##  Max.   :30.0   WALKING_UPSTAIRS  :1980                             
    ##          Instrument     Jerk          Magnitude    Variable    Axis     
    ##  Accelerometer:7200   NA  :7200   NA       :8640   Mean:5940   NA:3240  
    ##  Gyroscope    :4680   Jerk:4680   Magnitude:3240   SD  :5940   X :2880  
    ##                                                                Y :2880  
    ##                                                                Z :2880  
    ##                                                                         
    ##                                                                         
    ##      count          average        
    ##  Min.   :36.00   Min.   :-0.99767  
    ##  1st Qu.:49.00   1st Qu.:-0.96205  
    ##  Median :54.50   Median :-0.46989  
    ##  Mean   :57.22   Mean   :-0.48436  
    ##  3rd Qu.:63.25   3rd Qu.:-0.07836  
    ##  Max.   :95.00   Max.   : 0.97451
