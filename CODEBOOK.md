# CODEBOOK
Keh-Harng Feng  
February 14, 2017  



## Tidy Data Codebook


### Fixed Variables
The tidy data frame generated from run_analysis.R contains the following fixed 
variables in the first three columns:

```
## [1] "activity"
```
A factor containing descriptive labels of identified activity. Possible values 
are:

WALKING

WALKING_UPSTAIRS

WALKING_DOWNSTAIRS

SITTING

STANDING

LAYING


```
## [1] "subject"
```
A factor containing numerical identifier for the subject.

Possible values: integers from 1 to 30.


```
## [1] "origin"
```
A factor containing descriptive labels of the origin of data where the 
measurement is derived. 

Possible values: 'test', 'train'

### Measured Variables

The rest of the columns in the data frame are measured variables with the following 
names:

```
##  [1] "tbodyaccmeanx"            "tbodyaccmeany"           
##  [3] "tbodyaccmeanz"            "tbodyaccstdx"            
##  [5] "tbodyaccstdy"             "tbodyaccstdz"            
##  [7] "tgravityaccmeanx"         "tgravityaccmeany"        
##  [9] "tgravityaccmeanz"         "tgravityaccstdx"         
## [11] "tgravityaccstdy"          "tgravityaccstdz"         
## [13] "tbodyaccjerkmeanx"        "tbodyaccjerkmeany"       
## [15] "tbodyaccjerkmeanz"        "tbodyaccjerkstdx"        
## [17] "tbodyaccjerkstdy"         "tbodyaccjerkstdz"        
## [19] "tbodygyromeanx"           "tbodygyromeany"          
## [21] "tbodygyromeanz"           "tbodygyrostdx"           
## [23] "tbodygyrostdy"            "tbodygyrostdz"           
## [25] "tbodygyrojerkmeanx"       "tbodygyrojerkmeany"      
## [27] "tbodygyrojerkmeanz"       "tbodygyrojerkstdx"       
## [29] "tbodygyrojerkstdy"        "tbodygyrojerkstdz"       
## [31] "tbodyaccmagmean"          "tbodyaccmagstd"          
## [33] "tgravityaccmagmean"       "tgravityaccmagstd"       
## [35] "tbodyaccjerkmagmean"      "tbodyaccjerkmagstd"      
## [37] "tbodygyromagmean"         "tbodygyromagstd"         
## [39] "tbodygyrojerkmagmean"     "tbodygyrojerkmagstd"     
## [41] "fbodyaccmeanx"            "fbodyaccmeany"           
## [43] "fbodyaccmeanz"            "fbodyaccstdx"            
## [45] "fbodyaccstdy"             "fbodyaccstdz"            
## [47] "fbodyaccjerkmeanx"        "fbodyaccjerkmeany"       
## [49] "fbodyaccjerkmeanz"        "fbodyaccjerkstdx"        
## [51] "fbodyaccjerkstdy"         "fbodyaccjerkstdz"        
## [53] "fbodygyromeanx"           "fbodygyromeany"          
## [55] "fbodygyromeanz"           "fbodygyrostdx"           
## [57] "fbodygyrostdy"            "fbodygyrostdz"           
## [59] "fbodyaccmagmean"          "fbodyaccmagstd"          
## [61] "fbodybodyaccjerkmagmean"  "fbodybodyaccjerkmagstd"  
## [63] "fbodybodygyromagmean"     "fbodybodygyromagstd"     
## [65] "fbodybodygyrojerkmagmean" "fbodybodygyrojerkmagstd"
```

These correspond to the following measured variables from the original UCI HAR 
dataset:

```
##  [1] "1 tBodyAcc-mean()-X"             "2 tBodyAcc-mean()-Y"            
##  [3] "3 tBodyAcc-mean()-Z"             "4 tBodyAcc-std()-X"             
##  [5] "5 tBodyAcc-std()-Y"              "6 tBodyAcc-std()-Z"             
##  [7] "41 tGravityAcc-mean()-X"         "42 tGravityAcc-mean()-Y"        
##  [9] "43 tGravityAcc-mean()-Z"         "44 tGravityAcc-std()-X"         
## [11] "45 tGravityAcc-std()-Y"          "46 tGravityAcc-std()-Z"         
## [13] "81 tBodyAccJerk-mean()-X"        "82 tBodyAccJerk-mean()-Y"       
## [15] "83 tBodyAccJerk-mean()-Z"        "84 tBodyAccJerk-std()-X"        
## [17] "85 tBodyAccJerk-std()-Y"         "86 tBodyAccJerk-std()-Z"        
## [19] "121 tBodyGyro-mean()-X"          "122 tBodyGyro-mean()-Y"         
## [21] "123 tBodyGyro-mean()-Z"          "124 tBodyGyro-std()-X"          
## [23] "125 tBodyGyro-std()-Y"           "126 tBodyGyro-std()-Z"          
## [25] "161 tBodyGyroJerk-mean()-X"      "162 tBodyGyroJerk-mean()-Y"     
## [27] "163 tBodyGyroJerk-mean()-Z"      "164 tBodyGyroJerk-std()-X"      
## [29] "165 tBodyGyroJerk-std()-Y"       "166 tBodyGyroJerk-std()-Z"      
## [31] "201 tBodyAccMag-mean()"          "202 tBodyAccMag-std()"          
## [33] "214 tGravityAccMag-mean()"       "215 tGravityAccMag-std()"       
## [35] "227 tBodyAccJerkMag-mean()"      "228 tBodyAccJerkMag-std()"      
## [37] "240 tBodyGyroMag-mean()"         "241 tBodyGyroMag-std()"         
## [39] "253 tBodyGyroJerkMag-mean()"     "254 tBodyGyroJerkMag-std()"     
## [41] "266 fBodyAcc-mean()-X"           "267 fBodyAcc-mean()-Y"          
## [43] "268 fBodyAcc-mean()-Z"           "269 fBodyAcc-std()-X"           
## [45] "270 fBodyAcc-std()-Y"            "271 fBodyAcc-std()-Z"           
## [47] "345 fBodyAccJerk-mean()-X"       "346 fBodyAccJerk-mean()-Y"      
## [49] "347 fBodyAccJerk-mean()-Z"       "348 fBodyAccJerk-std()-X"       
## [51] "349 fBodyAccJerk-std()-Y"        "350 fBodyAccJerk-std()-Z"       
## [53] "424 fBodyGyro-mean()-X"          "425 fBodyGyro-mean()-Y"         
## [55] "426 fBodyGyro-mean()-Z"          "427 fBodyGyro-std()-X"          
## [57] "428 fBodyGyro-std()-Y"           "429 fBodyGyro-std()-Z"          
## [59] "503 fBodyAccMag-mean()"          "504 fBodyAccMag-std()"          
## [61] "516 fBodyBodyAccJerkMag-mean()"  "517 fBodyBodyAccJerkMag-std()"  
## [63] "529 fBodyBodyGyroMag-mean()"     "530 fBodyBodyGyroMag-std()"     
## [65] "542 fBodyBodyGyroJerkMag-mean()" "543 fBodyBodyGyroJerkMag-std()"
```

The only difference is that 

1. Their names have been reformatted to only contain lowercase alphabetic 
characters. All illegal characters have been removed.

2. Their values are computed averages of the original values, grouped by subject 
and activity of the measurements.

Otherwise what they represent are exactly identical to the original 
specifications from UCI:

```
The features selected for this database come from the accelerometer and gyroscope
3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 
't' to denote time) were captured at a constant rate of 50 Hz. Then they were 
filtered using a median filter and a 3rd order low pass Butterworth filter with 
a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal 
was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and 
tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency 
of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in 
time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the 
magnitude of these three-dimensional signals were calculated using the Euclidean 
norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals 
producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, 
fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag


The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
```
