# README
Keh-Harng Feng  
February 14, 2017  



## Goal

The script merges the test and training sets from the original UCI HAR dataset together then reorganizes them into a tidy dataset. 
Specifically, a tidy data is one that satisfies the following three conditions:

1. Each variable forms a column.

2. Each observation forms a row.

3. Each type of observational unit forms a table.

as defined by Hadley Wickham [1].

## List of Extracted Variables
Per the instruction, only the mean and std values are listed and subsequently processed. Also, the dataset is split into a training and testing set. Hence, 
every variable identified below is chosen without loss of generality from the 
training set. They are duplicated exactly once in the test set. With this in 
mind, identified variables from the original data to be processed are:

### Fixed Variables:

Subject (from /train/subject_train.txt): subject for the each measurement

Activity Labels (from /activity_labels.txt): descriptive labels of the activity

Activity Pointers (from /train/y_train.txt): numerical activity label matched to 
each measurement

### Measured Variables:

These are found in /train/X_train.txt


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

## Methodology

All measured variables from X_train.txt are extracted using read.table() with white space as the separator. Full column names are read from features.txt and assigned accordingly to this data frame. The columns corresponding to desired variables (ie: mean and std) are then copied to a new data frame by matching the column names to the list of measured variables above. The fixed variable "Subject" can be directly read using readLines() into a column matching subject to each measurement with no issue. However the descripitive activity labels must be matched using activity pointers.  This is done by first assigning activity pointers to the measurements with cbind then transforming the numerical pointers to a factor variable with levels matching the corresponding activity labels.

An identical process is carried out for the Test set.

### Data Merging

Prior to merging a new fixed factor variable named 'origin' is inserted for both Test and Training in order to identify the origin of the measurements. The factor levels are simply set to 'test' and 'train'.

Test set and Training set are merged() by matching subjects with all = TRUE. This is because each subject can only participate for either Test or Training set but never both. The expectation is therefore to find no match whatsoever. With all set to TRUE all extracted variables will be merged without losing any measurements.

## Variable Names & Order

Variable names are formatted to contain only lower alphanumerical letters with no space. Fixed variables are placed from left to right with 'origin' being the first, followed by 'subject' and finally 'activity'. Measured variables follow with their original order and the whole data set is sorted using the three fixed variables with the corresponding priority. This is consistent with Hadley Wickham's protocol of creating tidy data [1]. The content of the reorganized dataset is detailed in the [CODEBOOK](./CODEBOOK.md).

[1]: http://vita.had.co.nz/papers/tidy-data.pdf
