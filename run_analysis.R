##  Cleaning and Getting Data
##  Course Project

# Load libraries
library(dplyr)
library(tidyr)
library(reshape)

# 1. Merges the training and the test sets to create one data set.
subject_test <- read.table("test/subject_test.txt")
X_test <- read.table("test/X_test.txt")
Y_test <- read.table("test/Y_test.txt")

subject_test <- cbind(subject_test,"Test")
names(subject_test)[2] <- "Group"
subXY_test <- cbind(subject_test, Y_test, X_test)
#subXY_test <- cbind(subject_test, Y_test, X_test, "test")
#names(subXY_test)[564] <- paste("Group")  # needed in order to use rbind below 

subject_train <- read.table("train/subject_train.txt")
X_train <- read.table("train/X_train.txt")
Y_train <- read.table("train/Y_train.txt")

subject_train <- cbind(subject_train,"Train")
names(subject_train)[2] <- "Group"
subXY_train <- cbind(subject_train, Y_train, X_train)
#subXY_train <- cbind(subject_train, Y_train, X_train, "train")
#names(subXY_train)[564] <- paste("Group")  # needed in order to use rbind below 

subXY1 <- rbind(subXY_test, subXY_train)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
subXY1_measures <- subXY1[,4:ncol(subXY1)]
step2_mean <- sapply(subXY1_measures, mean)
step2_sd <- sapply(subXY1_measures, sd)

# 3. Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table("activity_labels.txt")
subXY2 <- cbind( subXY1[,1:2], Activity="", subXY1[,3:ncol(subXY1)], stringsAsFactors = FALSE )

for (i in 1:nrow(subXY1)) {
  j <- subXY2[i,4]
  subXY2[i,3] <- as.character(activity_labels[j,2])
  }

# 4. Appropriately labels the data set with descriptive variable names.
features <- read.table("features.txt")

names(subXY2)[1] <- "Subject"
names(subXY2)[2] <- "Group"
names(subXY2)[3] <- "Activity"
names(subXY2)[4] <- "ActNumber"
for (i in 1:nrow(features)) {
  j <- i + 4
  names(subXY2)[j] <- as.character(features[i,2])
}

# 5. From the data set in step 4, creates a second, independent tidy data set with the average
#      of each variable for each activity and each subject.

subXY3 <- melt(subXY2, id = c("Subject", "Group", "Activity","ActNumber"))

subXY4 <-
  subXY3 %>%
  group_by(Subject, Activity) %>%
  summarize(aver = mean(value)) %>%
      write.table(subXY4, file = "subXY4.txt",row.name = FALSE)
    
