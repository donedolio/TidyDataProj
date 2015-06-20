**Study Design:**
-----------------

An experiment to record "Human Activity Recognition Using Smartphones Data Set" has been conducted as described in the following website:

- http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

***Original data set:***

- The original experiment was conducted on 30 individuals performing 6 different activities, and was divided in 2 groups. 
- 70% of the individuals were selected for generating the training data (Train group)
- 30% of the individuals were selected for generating the test data (Test group)
- A total of 561 measurements (variables) were recorded for each individual

***Modified data set:***

Our modified data set is based on the original data set. The following are the major differences:

- Both the X_train and X_test data sets were combined into one larger data set.
- Column names were added to our data set based on the features table from the original data.
- A subjectID column was added to show the individuals performing the activity. This was based on the subject_test and subject_train tables.
- An activityType column was added and numbers 1 through 6 were replaced by the corresponding activity using y_test/y_train and the activity_labels tables
- Only the measurements on the mean and standard deviation of the measurements from the original data set were used.
- We calculated the average of each measurement for each subject/activity.
- The dimensions of the data set are 180 (30 individuals * 6 activities) by 68 (subjectID, activityType and 66 mean/std based measurements)


**Code Book:**
----------

1) *subjectID:* It takes values from 1 to 30, representing each of the 30 individuals that completed the experiment

- range 1:30

2) *activityType:* While wearing the smartphone on the waist, each individual performed 6 activities as described below

- LAYING
- SITTING
- STANDING
- WALKING
- WALKING_DOWNSTAIRS
- WALKING_UPSTAIRS

***The following applies to our modified data set variables:***

- Our data set gets the signals described in the original data set and calculate the average for each activity and each subject, that's why we used 'Mean-' at the beginning of each one. 
- '-mean' is used to identify that the mean value was calculated in the original set
- '-std' is used to identify that the standard deviation value was calculated in the original set
- '-X', '-Y', and '-Z' are used to denote 3-axial signals in the X, Y and Z directions.

**NOTE:** We only calculated the average of the variables from the original data set. For more information about the original data set variables, refer to the the ***'References'*** section at the bottom of this document.

Tidy data set variables:

3) *Mean-tBodyAcc-mean-X*

4) *Mean-tBodyAcc-mean-Y*

5) *Mean-tBodyAcc-mean-Z*

6) *Mean-tBodyAcc-std-X*

7) *Mean-tBodyAcc-std-Y*

8) *Mean-tBodyAcc-std-Z*

9) *Mean-tGravityAcc-mean-X*

10) *Mean-tGravityAcc-mean-Y*

11) *Mean-tGravityAcc-mean-Z*

12) *Mean-tGravityAcc-std-X*

13) *Mean-tGravityAcc-std-Y*

14) *Mean-tGravityAcc-std-Z*

15) *Mean-tBodyAccJerk-mean-X*

16) *Mean-tBodyAccJerk-mean-Y*

17) *Mean-tBodyAccJerk-mean-Z*

18) *Mean-tBodyAccJerk-std-X*

19) *Mean-tBodyAccJerk-std-Y*

20) *Mean-tBodyAccJerk-std-Z*

21) *Mean-tBodyGyro-mean-X*

22) *Mean-tBodyGyro-mean-Y*

23) *Mean-tBodyGyro-mean-Z*

24) *Mean-tBodyGyro-std-X*

25) *Mean-tBodyGyro-std-Y*

26) *Mean-tBodyGyro-std-Z*

27) *Mean-tBodyGyroJerk-mean-X*

28) *Mean-tBodyGyroJerk-mean-Y*

29) *Mean-tBodyGyroJerk-mean-Z*

30) *Mean-tBodyGyroJerk-std-X*

31) *Mean-tBodyGyroJerk-std-Y*

32) *Mean-tBodyGyroJerk-std-Z*

33) *Mean-tBodyAccMag-mean*

34) *Mean-tBodyAccMag-std*

35) *Mean-tGravityAccMag-mean*

36) *Mean-tGravityAccMag-std*

37) *Mean-tBodyAccJerkMag-mean*

38) *Mean-tBodyAccJerkMag-std*

39) *Mean-tBodyGyroMag-mean*

40) *Mean-tBodyGyroMag-std*

41) *Mean-tBodyGyroJerkMag-mean*

42) *Mean-tBodyGyroJerkMag-std*

43) *Mean-fBodyAcc-mean-X*

44) *Mean-fBodyAcc-mean-Y*

45) *Mean-fBodyAcc-mean-Z*

46) *Mean-fBodyAcc-std-X*

47) *Mean-fBodyAcc-std-Y*

48) *Mean-fBodyAcc-std-Z*

49) *Mean-fBodyAccJerk-mean-X*

50) *Mean-fBodyAccJerk-mean-Y*

51) *Mean-fBodyAccJerk-mean-Z*

52) *Mean-fBodyAccJerk-std-X*

53) *Mean-fBodyAccJerk-std-Y*

54) *Mean-fBodyAccJerk-std-Z*

55) *Mean-fBodyGyro-mean-X*

56) *Mean-fBodyGyro-mean-Y*

57) *Mean-fBodyGyro-mean-Z*

58) *Mean-fBodyGyro-std-X*

59) *Mean-fBodyGyro-std-Y*

60) *Mean-fBodyGyro-std-Z*

61) *Mean-fBodyAccMag-mean*

62) *Mean-fBodyAccMag-std*

63) *Mean-fBodyBodyAccJerkMag-mean*

64) *Mean-fBodyBodyAccJerkMag-std*

65) *Mean-fBodyBodyGyroMag-mean*

66) *Mean-fBodyBodyGyroMag-std*

67) *Mean-fBodyBodyGyroJerkMag-mean*

68) *Mean-fBodyBodyGyroJerkMag-std*

**References**
----------

The following description for the variables come from the original dataset:

- The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

- Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

- Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

Original variables (multiple measures were performed on these, but for our tidy data set we only use 'mean' and 'standard deviation'):

tBodyAcc-XYZ

tGravityAcc-XYZ

tBodyAccJerk-XYZ

tBodyGyro-XYZ

tBodyGyroJerk-XYZ

tBodyAccMag

tGravityAccMag

tBodyAccJerkMag

tBodyGyroMag

tBodyGyroJerkMag

fBodyAcc-XYZ

fBodyAccJerk-XYZ

fBodyGyro-XYZ

fBodyAccMag

fBodyAccJerkMag

fBodyGyroMag

fBodyGyroJerkMag
