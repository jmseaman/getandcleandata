# Getting and Cleaning Data README

## Transformations
1. Merges the training and the test sets to create one data set.
- Established Working directory where files reside with 'setwd()'
- Loaded test and training datasets to memory with 'read.table()'
- Merged the training and test sets into one (x and y separately) with 'rbind()'
- Removed obsolete variables for cleanliness

2. Extracts only the measures on the mean and standard deviation for each measurement.
- Loaded measurement names to memory with 'read.table()'
- Extracted measurements with "mean" or "std" in name with associated location with 'grep()'
- Dropped fields in x without fields "mean" or "std" using subseting 
- Renamed fields in x using 'names()'
- Removed obsolete variables for cleanliness

3. Uses descriptive activity names to name the activities in the data set.
- Loaded activity labels to memory with 'read.table()'
- Renamed y with activity labels rather than numerical categories
- Removed obsolete variables for cleanliness

4. Appropriately labels the data set with descriptive variable names.
- Renamed field names with vector from features variable using 'names()'
- Removed obsolete variables for cleanliness

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
- Loaded subject training and test data sets into memory with 'read.table()'
- Merged the training and test sets into one with 'rbind()'
- Merged the subject table, x table, and y table into one tidy data set with 'cbind()'
- Determined average of each variable by subject and activity with 'aggregate()' using complete data set by subject and activity and function 'mean'
- Removed obsolete variables for cleanliness

##Created Data Set File
- Wrote table using 'write.table()'

##Variables
1. Original Data Variables
- 'x_train' X_train.txt read to memory
- 'x_test' X_test.txt read to memory
- 'y_train' y_train.txt read to memory
- 'y_test' y_test.txt read to memory
- 'features' features.txt read to memory
- 'activities' activity_labels.txt read to memory; used to label activities in 'y_table'
- 'subject_train' subject_train.txt read to memory
- 'subject_test' subject_test.txt read to memory

2. Transformed Variables
- 'x_table' merged 'x_train' and 'x_test' 
- 'y_table' merged 'y_train' and 'y_test'
- 'select_features' subset of 'features' with values containing either "mean" or "std" in a string; used to reduce fields in 'x_table'
- 'subject_table' merged 'subject_train' and 'subject_test'; used to add subject information
- 'complete_table' merging of 'x_table', 'y_table', and 'subject_table' for a tidy data set
- 'complete_table_average' average of all variables in 'complete_table' by subject and activity