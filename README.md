# getting_and_cleaning_data_course_project

# Summary

This repository contains my course project assignment submission for the Course 3: Getting and Cleaning Data of
the Data Science Specialization course set from Coursera.

# Description
The purpose of this assignment is to demonstrate the knowledge obtained in the course pertaining to getting and
cleaning data in preparation for analysis. The steps are:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# To-Do

Extract the run_analysis.R file from the repository.

Run:

   **> Rscript run_analysis.R**
    
The run_analysis.R script will download the input data set file from the url:

   **https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip**
    
The script will unzip the data set file and generate a tidy data table file in the current working directory as:

   **> tidy_data.txt**
