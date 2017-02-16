# Set default dataset directory path
dir <- './UCI HAR Dataset'

# Check existence of data set.  Download & extract if necessary
# 
# ARGUMENT:
# path: a string pointing to the dataset directory path
check_data <- function(path = dir) {
    if (!file.exists(path)) {
        download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip',
                      destfile = 'Dataset.zip')
        
        unzip('Dataset.zip')
    }
}

# Helper function that returns matched features (mean and std) to be used as 
# variable labels
# 
# ARGUMENT:
# path: a string pointing to the dataset directory path
# 
# RETURNS:
# A character array of matched feature labels
var_labels <- function(path = dir) {
    features <- readLines(paste(path, '/features.txt', sep = ''))
    features[grep('mean\\(\\)|std\\(\\)', features)]
}


# Helper function to preprocess one of the test/training datasets
# 
# ARGUMENTS:
# dir_path: string specifying dataset root folder path
# 
# set: string specifying either 'test' or 'train' to be preprocessed
#
# colnames: character vector containing column names of the measured data
# 
# act_lab: character vector containing descriptive activity labels.
# 
# RETURNS:
# Preprocessed data frame containing only the desired measured variables as 
# specified in README.
set_preprocess <- function(dir_path = dir, set, colnames, act_lab) {
    full_path = paste(dir_path, '/', set, '/X_', set, '.txt', sep = '')
    
    # data frame with all possible measured variables and their names
    full_data <- read.table(full_path, header = FALSE)
    
    names(full_data) <- colnames
    
    # data frame with only the required measured variables
    want <- var_labels()
    
    data <- full_data[,want]
    
    # Add activity
    activity <- as.numeric(readLines(paste(dir_path, '/', set, '/y_', set, '.txt', 
                                        sep = '')))
    
    activity <- factor(activity, labels = act_lab)
    data <- cbind(data, activity)
    
    # Add subject
    subject <- as.numeric(readLines(paste(dir_path, '/', set, '/subject_', set, 
                                          '.txt', sep = '')))
    
    data <- cbind(data, subject)
    
    # Add origin
    origin <- rep(as.factor(set), times = length(subject))
    
    data <- cbind(data, origin)
    
}

# Generate column names and activity labels
colnames <- readLines(paste(dir, '/features.txt', sep = ''))

temp_lab <- readLines(paste(dir, '/activity_labels.txt', sep = ''))
activity_labels <- substr(temp_lab, 3, nchar(temp_lab))

# Preprocess datasets
test <- set_preprocess(dir, 'test', colnames, activity_labels)

train <- set_preprocess(dir, 'train', colnames, activity_labels)

# Merge by appending matching columns
merged_data <- rbind(test, train)

# Order columns and format names.
ncols <- length(names(merged_data))

merged_data <- merged_data[c(ncols:(ncols-2), 1:(ncols-3))]

merged_data <- merged_data[order(merged_data[1], merged_data[2], merged_data[3]),]

formatted_names <- gsub('\\(\\)', '', 
              gsub('-', '', 
               tolower(
                   sapply(strsplit(names(merged_data), ' '), function(x) x[2]))))

names(merged_data)[4:ncols] <- formatted_names[4:ncols]

# Compute average of each variable based on subject and activity and create tidy 
# data
#tidy_set <- aggregate(merged_data, 
#                      by = list(merged_data$origin, merged_data$subject, 
#                                merged_data$activity), mean)

#write.table(tidy_set, file = 'tidy_set.txt', row.names = FALSE)
