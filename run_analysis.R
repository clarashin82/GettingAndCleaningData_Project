### 1. Merge the training and the test sets to create one data set ###
# 1-a. read test and train data in
X_test <- read.table("C:/Users/Clarish/Desktop/UCI HAR Dataset/test/X_test.txt")
X_train <- read.table("C:/Users/Clarish/Desktop/UCI HAR Dataset/train/X_train.txt")
# 1-b. bind the two data sets above
X <- rbind(X_test, X_train)

### 2. Extract only the measurements on the mean and standard deviation 
#      for each measurement  ###
# 2-a. this gives the means and standard deviations by each column. (651 features)
measurements <- cbind(colMeans(X), apply(X, 2, sd))

### 3. Use descriptive activity names to name the activities in the data set ###
# 3-a. read activity labels data in
y_test <- read.table("C:/Users/Clarish/Desktop/UCI HAR Dataset/test/y_test.txt")
y_train <- read.table("C:/Users/Clarish/Desktop/UCI HAR Dataset/train/y_train.txt")
activity_labels <- read.table("C:/Users/Clarish/Desktop/UCI HAR Dataset/activity_labels.txt")
# 3-b. bind two sets of labels of test and train data
activities <- rbind(y_test, y_train)
# 3-c. left join the activity labels to y_test and y_train
library(plyr)
activities <- join(activities, activity_labels, type = "left")

### 4. Appropriately labels the data set with descriptive variable names ###
# 4-a. read features data in
features <- read.table("C:/Users/Clarish/Desktop/UCI HAR Dataset/features.txt")
# 4-b. name the columns as the feature data
colnames(X) <- features[,2]

### 5. Creates a second, independent tidy data set 
#      with the average of each variable for each activity and each subject ###
# 5-a. read subjects data in
subject_test <- read.table("C:/Users/Clarish/Desktop/UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("C:/Users/Clarish/Desktop/UCI HAR Dataset/train/subject_train.txt")
# 5-b. bind the two data sets above
subjects <- rbind(subject_test, subject_train)
# 5-c. make the data clean. Final dataset has 563 columns (561 features, subject, activity) and 10299 rows in total.
X$subject <- as.factor(subjects[,1])
X$activities <- activities[,2]
# 5-d. use aggregate function to get the means of each feature by subject and activity. (the group is unique 180 total)
tidyset <- aggregate(X[,1:561], by=list(X$activities, X$subject), FUN=mean)
# 5-e. rename first two columns to be more readable
colnames(tidyset)[1:2] <- c("Activity", "Subject")
# 5-f. write the txt file.
write.table(tidyset, file = "tidyset.txt", row.name=FALSE)
