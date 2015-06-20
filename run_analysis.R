# Download all files to be used in the project

temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",temp)
features <- read.table(unz(temp, "UCI HAR Dataset/features.txt"), quote="\"")
activity_labels <- read.table(unz(temp, "UCI HAR Dataset/activity_labels.txt"), quote="\"")
X_test <- read.table(unz(temp, "UCI HAR Dataset/test/X_test.txt"), quote="\"")
y_test <- read.table(unz(temp, "UCI HAR Dataset/test/y_test.txt"), quote="\"")
subject_test <- read.table(unz(temp, "UCI HAR Dataset/test/subject_test.txt"), quote="\"")
X_train <- read.table(unz(temp, "UCI HAR Dataset/train/X_train.txt"), quote="\"")
y_train <- read.table(unz(temp, "UCI HAR Dataset/train/y_train.txt"), quote="\"")
subject_train <- read.table(unz(temp, "UCI HAR Dataset/train/subject_train.txt"), quote="\"")
unlink(temp)

#Rename column on subject_test/subject_train from "V1" to "subjectID"
colnames(subject_test)[colnames(subject_test)=="V1"] <- "subjectID"
colnames(subject_train)[colnames(subject_train)=="V1"] <- "subjectID"

#Rename column on activity_labels from "V2" to "activityType"
colnames(activity_labels)[colnames(activity_labels)=="V2"] <- "activityType"

# Add sequence column to y_test and y_train. 
# This will be used to keep the current row order when merging
y_test <- data.frame(y_test, index = seq_len(nrow(y_test)))
y_train <- data.frame(y_train, index = seq_len(nrow(y_train)))

# Merge y_test/y_train and activity labels by ID (first column of each)
# This way we can add the activity label to the X_test/Xtrain instead of a number
y_test  <- merge(y_test, activity_labels, by.x = "V1", by.y = "V1", all=TRUE)
y_train  <- merge(y_train, activity_labels, by.x = "V1", by.y = "V1", all=TRUE)

# Order by the sequence created to maintain original y_test/y_train order
y_test <- arrange(y_test,index)
y_train <- arrange(y_train,index)

# Create vector based on the features to use as column names on X_test/X_train
origColVector <- as.vector(features$V2)

# Change column names with vector created from the features data frame
colnames(X_test) <- origColVector
colnames(X_train) <- origColVector

# Add subject_test (Subject ID) and y_test/y_train (Activity Type) to X_test/X_train
X_test  <- cbind(subject_test, activityType=y_test$activityType, X_test)
X_train  <- cbind(subject_train, activityType=y_train$activityType, X_train)

# STEP 1 - Merges the training and the test sets to create one data set
mergedData <- rbind(X_test, X_train)

# STEP 2 - Keep only columns that have "mean()" or "std()" on the title
mergedData <- mergedData[, grep("\\bmean()\\b|\\bstd()\\b|subjectID|activityType", colnames(mergedData))]

# Create final tidy data set    
tidyData <- aggregate(.~subjectID+activityType, data=mergedData, mean)

# Order by subjectID and then by activityType (both ascending)
tidyData <- arrange(tidyData,subjectID,activityType)

# Fix the column names on the tidy data set
tidyColNames <- as.vector(colnames(tidyData))
tidyColNames <- gsub("\\()", "", tidyColNames)
tidyColNames[3:68] <- paste("Mean-", tidyColNames[3:68], sep="")
colnames(tidyData) <- tidyColNames

# Write tidyData file to text file
write.table(tidyData, file = "tidyData.txt", row.names = FALSE)

