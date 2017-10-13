# R Script for Gettign and Cleaning Data Course Project

# 1. Merges the training and the test sets to create one data set.

setwd() #Establish local working directory - User to customize

x_train <- read.table("train/X_train.txt")
x_test <- read.table("test/X_test.txt")
y_train <- read.table("train/y_train.txt")
y_test <- read.table("test/y_test.txt")

x_table <- rbind(x_train, x_test)
y_table <- rbind(y_train, y_test)

rm(x_train, x_test, y_train, y_test)

# 2. Extracts only the measures on the mean and standard deviation for each measurement.

features <- read.table("features.txt")
select_features <- grep("mean|std" , features[, 2])
x_table <- x_table[, select_features]

# 3. Uses descriptive activity names to name the activities in the data set

activities <- read.table("activity_labels.txt")
y_table[,1] <- activities[y_table[,1],2]
names(y_table) <- "activity"
rm(activities)

# 4. Appropriately labels the data set with descriptive variable names.

names(x_table) <- features[select_features, 2]
rm(features, select_features)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
subject_train <- read.table("train/subject_train.txt")
subject_test <- read.table("test/subject_test.txt")
subject_table <- rbind(subject_train, subject_test)
names(subject_table) <- "subject"

complete_table <- cbind(subject_table, x_table, y_table)
rm(subject_table, x_table, y_table, subject_train, subject_test)

complete_table_average <- aggregate(complete_table[, 2:80], complete_table[, c("subject", "activity")], FUN = mean)

# Create Data Set as a txt file created with write.table() using row.name=FALSE
write.table(complete_table_average, file="complete_table_average.txt", row.names = FALSE)