# Getting and cleaning data class project
library(plyr)

# Setting the work directory:
setwd("~/Dropbox/Data Scientist Specialization/Getting and cleaning data/Project/")

# 0: Downloading the dataset:
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "Dataset.zip", method="curl")
unzip("Dataset.zip")

# 1: Merging the training and the test sets in order to create one data set.

## Reading the training files:
x.train <- read.table("UCI HAR Dataset/train/X_train.txt")
y.train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject.train <- read.table("UCI HAR Dataset/train/subject_train.txt")
data.train <- data.frame(x.train, y.train, subject.train)

### Reading the test files:
x.test <- read.table("UCI HAR Dataset/test/X_test.txt")
y.test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject.test <- read.table("UCI HAR Dataset/test/subject_test.txt")
data.test <- data.frame(x.test, y.test, subject.test)

## Merging the train and test data sets:
data <- rbind(data.train, data.test)

# 2: Extracting the measurements on the mean and standard deviation for each measurement.

## Reading the feature names:
features <- read.table("UCI HAR Dataset/features.txt")
##Extracting only the measurements on the mean and standard deviation for each measurement:
mean.id <- grep("mean()",features$V2, ignore.case = F) # Column Ids for means
std.id <- grep("std()",features$V2, ignore.case = F) # Column Ids for standard deviations
ids <- c(mean.id, std.id) # Column Ids for both mean and standard deviation
data.mean.std <- cbind(data$V1.1, data$V1.2, data[, ids]) # Only means and standard deviations for each measurement
names(data.mean.std) <- c("activity", "subjId", as.character(droplevels(features$V2[ids])))

## 3: Use descriptive activity names to name the activities in the data set.
activity.names <- read.table("UCI HAR Dataset/activity_labels.txt")
data.mean.std$activity <- tolower(activity.names$V2[data.mean.std$activity])

## 4: Appropriately labels the data set with descriptive variable names.
clean.features <- names(data.mean.std) 
clean.features <- gsub("-", "", clean.features)
clean.features <- gsub("\\(\\)", "", clean.features)
names(data.mean.std) <- c(clean.features)

## 5: From the data set in step 4, create a second, independent tidy data set with the average of 
# each variable for each activity and each subject.
second.dataset <- ddply(data.mean.std, c("activity","subjId"), numcolwise(mean))
