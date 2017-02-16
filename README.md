# README
Keh-Harng Feng  
February 14, 2017  



## Goal

The script merges the test and training sets from the original UCI HAR dataset 
together then reorganizes them into a tidy dataset that contains averages of 
each measured variable categorized by the subject and activity. 

A tidy data is one that satisfies the following three conditions:

1. Each variable forms a column.

2. Each observation forms a row.

3. Each type of observational unit forms a table.

as defined by Hadley Wickham [1].

## List of Extracted Variables
Per the instruction, only the mean and std values are listed and subsequently 
processed. Also, the dataset is split into a training and testing set. Hence, 
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

## Data Preprocessing

Using the training set as an example, run_analysis first checks the existence of 
the dataset and download the data if necessary using check_data(). It then 
extracts column names from features.txt and activity labels from activity_labels.txt. 
These are passed to set_preprocess() for data preprocessing.

In set_preprocess(), all measured variables from X_train.txt are extracted using 
read.table() with white space as the separator. Column names obtained from before 
are added to the data frame and activity pointers read from y_train.txt are 
matched to activity labels and transformed into a factor. This factor is then 
column-bound to the data frame. The columns corresponding to desired variables 
(ie: mean and std) are then copied to a new data frame by matching the column 
names to the list of measured variables above. The fixed variable "subject" can 
be directly read from subject_train.txt using readLines() into a column matching
each measurement with no issue. An additional fixed factor variable 'origin' is 
created to indicate the origin of the data, in this case the training set.

An identical process is carried out for the Test set.

### Data Merging

Test set and Training set are merged using rbind(). This is because each subject 
can only participate in either Test or Training set but never both. rbind() 
allows us to take advantage of automatic column name matching and simply append 
the measurements to the end.

## Computation of Average and Creation of Tidy Data

The merged data is already in a form that is almost tidy (besides column order).
Thus variable averages categorized by subject and activity can be easily computed
using aggregate(), with activity, subject and origin being the grouping factors.

### Variable Names & Order

Fixed variables are placed from left to right with 'activity' being the 
first, followed by 'subject' and finally 'origin'. Average of measured 
variables follow with their original order. Variable names are formatted to contain 
only lower alphanumerical letters with no space. 

The content of the tidy data is detailed in the [CODEBOOK](./CODEBOOK.md).

[1]: http://vita.had.co.nz/papers/tidy-data.pdf
