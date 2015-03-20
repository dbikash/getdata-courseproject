library(dplyr)

# Read labels for data and activity (names of the measured variables, activity)
data_labels <- read.table(".\\UCI HAR Dataset\\features.txt")
activity_labels <- read.table(".\\UCI HAR Dataset\\activity_labels.txt")

# Read training data set
train_data <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt")
# Set column names of the measured variables from the features
colnames(train_data) <- data_labels[,2]
# Read subject and activity for the training data set
train_subject <- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")
train_activity <- read.table(".\\UCI HAR Dataset\\train\\y_train.txt")
# Replace activity code by activity name (label)
for (i in seq_len(nrow(train_activity))) {
    activity <- train_activity[i,1]
    train_activity[i,1] <- as.character(activity_labels[activity,2])
    }
# Add activity column to training dataset
train_data <- cbind(train_activity, train_data)
colnames(train_data)[1] <- "Activity"
# Add subject column to training dataset
train_data <- cbind(train_subject, train_data)
colnames(train_data)[1] <- "Subject"

# Now read and prepare test data similarly
test_data <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt")
test_subject <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")
test_activity <- read.table(".\\UCI HAR Dataset\\test\\y_test.txt")
colnames(test_data) <- data_labels[,2]
for (i in seq_len(nrow(test_activity))) {
  activity <- test_activity[i,1]
  test_activity[i,1] <- as.character(activity_labels[activity,2])
}
test_data <- cbind(test_activity, test_data)
colnames(test_data)[1] <- "Activity"
test_data <- cbind(test_subject, test_data)
colnames(test_data)[1] <- "Subject"

# Merge training and test data sets
data <- rbind(train_data, test_data)

# Find labels containing strings "mean()" and "std()" in them
# Note: Labels like "angle(X,gravityMean)" and "fBodyAcc-meanFreq()-X" are not relevant
mean_names <- grep("mean()", names(data), value=TRUE, fixed=TRUE)
std_names <- grep("std()", names(data), value=TRUE, fixed=TRUE)
mean_std_data <- data[,c("Subject", "Activity", mean_names, std_names)]

# Finally create independent tidy data set with variables averaged by Subject & Activity
my_data <- tbl_df(mean_std_data)
tidy_data <- my_data %>% group_by(Subject, Activity) %>% summarise_each(funs(mean))
View(tidy_data)
