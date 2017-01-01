There are three main important files to be used.  
**1.run\_analysis.R**  
It is main code that will create tidy dataset, create markdown files by
relying on two R-Markdown files; CODEBOOK.Rmd and README.Rmd.

**2.CODEBOOK.Rmd**  
This is the file that run\_analysis will use to create CODEBOOK.md and
CODEBOOK.html (for easy reading)

**3.README.Rmd**  
This is the file that run\_analysis will use to create README.md and
README.html (for easy reading)

Connection between files will utilize library "rmarkdown". Notably, in
creating CODEBOOK, the run\_analysis will require library "seismic" too.

The result file would be allbind5tidy.txt.
