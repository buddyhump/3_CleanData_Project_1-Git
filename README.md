3_CleanData_Project_1-Git
=========================

Course Project for Class 3 of the Data Scientist Package (Clean and Getting Data)

 Cleaning and Getting Data Course 
	  Course Project - CodeBook
	  
	  A description of the raw data is included in the the "readme" file accompanying the original data included
	  in this repo as the renamed document "README-Human Activity Recognition Using Smartphones Dataset.txt".  
	  
	  The process used to analysis the data was as outlined with the five primary steps as part of the project
	  directions, namely:
	 1. Merges the training and the test sets to create one data set.
	 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
	 3. Uses descriptive activity names to name the activities in the data set
	 4. Appropriately labels the data set with descriptive variable names. 
	 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable
	 for each activity and each subject.
		  
	The resulting tidy data is contained in the file "subXY4.txt" included in this repo.
	The variables used in the intermediate files are the same as those included in the raw data.  Variables used 
	in the resultant file are:
		"Subject" which is an integer denoting the ID of the individual from whom the measurements were taken.
		"Activity" which is the label corresponding to what the subject was doing at the time of the measurement.
		"Aver" which is a numeric mean of measurements grouped first by Subject then secondarily by Activity

	 The processes used to fulfill the five steps of the assignment is contained in the R script file "run_analysis.R" 		(included in the in this directory).  To run the script in the R language the working directory should be set to and the script file contained in the same directory as the data such that the "test" and "train" are below the working directory.  The call to the "test" and "train" sub-directory are handled in the first step wherein the data is read. 
