# CodeBook.md

## Steps in transformation

The transformation required in the Course Project is done in run_analysis.R through the following steps:

1. Read the training and test data sets, including the subject and activity files (e.g. X_train.txt, subject_train.txt and y_train.txt).
2. Read the labels for data and activity (features.txt, activity_labels.txt). All are read into data frames.
3. For the training data set:
   a. Set column names of the measured variables (original data set) from the features.
   b. Replace all activity codes by the corresponding activity labels (e.g. 1 by "WALKING").
   c. Add a new column to the front containing activity labels by column-binding the activity labels. Name this column "Activity".
   d. Add a new column to the front containing subjects by column-binding the subjects data. Name this column "Subject".
   The prepared training data set contains 7352 observations of 563 variables.
4. Prepare the test data set similarly. The prepared test data set contains 2947 observations of 563 variables.
5. Now "merge" the training and test data sets by row-binding the two data frames. The merged data contains 10299 observations of 563 variables.
6. For extracting the mean and standard deviations, find columns with names containing the strings "mean()" and "std()" in them.
   Note that I consider labels like "angle(X,gravityMean)" and "fBodyAcc-meanFreq()-X" not to be relevant here and hence use an exact match.
   This gives 33 mean() columns and 33 std() columns.
7. Create a new data frame containing the "Subject", "Activity", mean() and std() columns from the merged data frame.
8. Group the above by Subject and Activity and summarize each of the other columns by their mean to give the final tidy data.
   The final tidy data has 180 observations of 68 variables.
