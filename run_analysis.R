#Codigo proyecto getting and cleaning
#To be evaluated by peers
#Enrique Alvarado
#Data Science Unison - Featur Engineering

#Load libraries
library(dplyr)

#Download the data

Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(Url, file.path("./data", "data.zip"))

#extract the file to the same data folder
unzip("./data/data.zip", exdir = "./data")

#creata path names and store in variables
test_path <- "data/UCI HAR Dataset/test"
train_path <- "data/UCI HAR Dataset/train"
info_path <- "data/UCI HAR Dataset"

#read names, labels and features in data set
features <- read.table(paste(info_path,"features.txt", sep = "/"))
act_labels <- read.table(paste(info_path,"activity_labels.txt", sep = "/"))
colnames(act_labels) <- c('activityId', 'activityType')

#Read training data set
subject_train <- read.table(paste(train_path, "subject_train.txt", sep="/"))
X_train <- read.table(paste(train_path, "X_train.txt", sep="/"))
Y_train <- read.table(paste(train_path, "Y_train.txt", sep="/"))
#set training data set col names
colnames(subject_train) <- "subjectId"
colnames(X_train) <- features[,2]
colnames(Y_train) <- "activityId"

#Read Test data set
subject_test <- read.table(paste(test_path, "subject_test.txt", sep="/"))
X_test <- read.table(paste(test_path, "X_test.txt", sep="/"))
Y_test <- read.table(paste(test_path, "Y_test.txt", sep="/"))
#set testing data set col names
colnames(subject_test) <- "subjectId"
colnames(X_test) <- features[,2]
colnames(Y_test) <- "activityId"

#1  merge both data set to one 
train <- cbind(Y_train, subject_train, X_train)
test <- cbind(Y_test, subject_test, X_test)
merged <- rbind(train, test)
#2 Extracts only the measurements on the mean and standard deviation for each measurement.
names <- colnames(merged)
columns<-grepl("subjectId|activityId|mean|std",names)
merged<-merged[ ,columns]


#3. Uses descriptive activity names to name the activities in the data set
merged <- merge(merged, act_labels, by="activityId", all.x= TRUE)
#temp <- select (merged, 1,2,82)
names <- colnames(merged)
merged$activityId <-merged$activityType
merged <- select(merged, -activityType)

#4. Appropriately labels the data set with descriptive variable names.
names <- colnames(merged)
names <- gsub("[\\(\\)-]", "", names)
names <- gsub("^f", "freq", names)
names <- gsub("^t", "time", names)
names <- gsub("mean", "Mean", names)
names <- gsub("std", "StdDev", names)
colnames(merged) <- names

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

group_result <- group_by(merged,subjectId,activityId)
mergedDataResult<- group_result %>%
    summarise_each(funs = mean)

write.table(mergedDataResult, "tidy_data.txt", row.names= FALSE, quote = TRUE)
