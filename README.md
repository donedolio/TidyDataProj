Tidy Data Set Creation
----------------------
This document will describe the steps taken to transform the raw data (original data set) into our tidy data set. These steps are also shown in the comments of the "run_analysis.R" script.

**Step 1**
In this step we identify which data from the original set are relevant to create our tidy data set. In this case, we used the following data sets:

 - features
 - activity_labels
 - X_test
 - y_test
 - subject_test
 - X_train
 - y_train
 - subject_train

**Step 2**
Rename column on subject_test/subject_train from "V1" to "subjectID". This way we'll have a descriptive column name on the tidy data set.

**Step 3**
Rename column on activity_labels from "V2" to "activityType". This way we'll have a descriptive column name on the tidy data set.

**Step 4**
To keep the desired order when merging tables, we created a sequence column on tables y_test/y_train

**Step 5**
 Merge y_test/y_train and activity labels by ID (first column of each table). This way we can add the descriptive activity label to the X_test/X_train instead of a number.

**Step 6**
Reorder the y_test/y_train by the sequence created in Step 4, keeping the original order in case the order changed after merging.

**Step 7**
Create a vector based on the features table and use it to name the columns of X_test/X_train.

**Step 8**
Using cbind, add the subject_test/subject_train subjectID column and y_test/y_train activityType column to X_test/X_train respectively.

**Step 9**
Using rbind, merge the X_test and X_train data sets to create one larger data set with all 30 individuals from the experiment.

**Step 10**
Extract only the measurements on the mean and standard deviation for each measurement. We used the grep() command to keep only the columns that contain "mean()" or "std()" in the title.

**Step 11**
Using the aggregate function calculate the mean of each variable for each activity and each subject. Then use the arrange function to order the data set by subjectID+activityType.

**Step 12**
Rename the columns of the tidy data set by adding "Mean-" in front. This will tell the users that the the values calculated in the table are averages.

**Step 13**
Use write.table to export the file as tidyData.txt
