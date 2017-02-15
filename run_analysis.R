# Check existence of data set.  Download & extract if necessary

dir <- './UCI HAR Dataset'
if (!file.exists(dir)) {
    download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip',
                  destfile = 'Dataset.zip')
    
    unzip('Dataset.zip')
}

# Generate a vector containing filepaths

fp <- list.files(path = dir, recursive = TRUE)

print(fp)

test <- read.table(paste(dir, '/', fp[5], sep = ''), header = FALSE)