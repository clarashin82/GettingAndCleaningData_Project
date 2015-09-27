# GettingAndCleaningData_Project
This is a repository containing Course Project of Getting and Cleaning Data Course.

The data is collected from the accelerometers from the Samsung Galaxy S smartphone.
The goal of the project is to merge and label the data to get a tidy data set.

The raw data is consisted of various test and training data sets.
run_analysis.R does the following:

1. Merge the training and the test sets to create one data set.
 a. Read in X_test.txt and X_training.txt. 
 b. Bind the two data sets. This dataset has 561 features and 10299 rows.

2. Extract only the measurements on the mean and standard deviation for each measurement.
 a. Using colMeans and apply function, it provides the mean and standard deviation of the 561 features.

3. Use descriptive activity names to name the activities in the data set.
 a. There are six kinds of activities in the dataset.
 b. y_test.txt and y_train.txt contains the activity information of the data. Get and bind them.
 c. activity_labels.txt shows the names of the six activities.
 d. Join activity_labels.txt to the result of 3-(b) to get the activities by each row.

4. Appropriately labels the data set with descriptive variable names.
 a. features.txt shows the names of 651 features.
 b. Name the columns of the result of 1-(b) to get the feature names.

5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 a. subject_test.txt and subject_train.txt contains the subject information of the data. Get and bind them.
 b. Add the subject and activity information as new columns to 1-(b).
 c. This makes a data set of 563 columns (561 features + activity + subject) and 10299 rows.
 d. Use aggregate function to 5-(c) to get the mean value for each activity + subject combination.
 e. There are 180 unique combinations of activity + subject.
 f. The aggration generates a tidy data set of 563 columns (561 features + activity + subject) and 180 rows. 
 g. Each value is the mean of each 180 cases. 
 h. Write a text file named tidyset.txt of the data frame.
