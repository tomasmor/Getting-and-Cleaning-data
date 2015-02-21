The script run_analysis.R performs the 5 steps described in the course project's definition.
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

First only columns with the mean and standart deviation measures are taken from features.
As activity data is addressed with values 1:6, we take the activity names and IDs from activity_labels.txt and they are substituted in the dataset.

Generated a new dataset with all the average measures for each subject (from 30 ) and activity type (from 6). 
The output file is called tidy_data.txt, and uploaded to this repository.