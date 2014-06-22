GCDCourseProject
================

Getting and Cleaning Data Course Project
This is my repository for the course project of Getting and Cleaning Data.

The script named "run_analysis.R" mainly do the following things:
  * Merges the training and the test sets to create one data set.
  * Extracts only the measurements on the mean and standard deviation for each measurement. 
  * Uses descriptive activity names to name the activities in the data set
  * Appropriately labels the data set with descriptive variable names. 
  * Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


The following section explains the steps for running the analysis on your own machine:
* Unzip the source
  ( https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip )
  into a folder on your local drive, say E:/UCI HAR Dataset (this is a path in Windows)

* Modify run_analysis.R: set the variable "rootfolder" to the path above

* Put run_analysis.R to  your working directory and then run the following command: 
  source("run_analysis.R")

* The scripte will a text file named "ResultDataSet.txt" in your working directory, that file is the tidy data set



