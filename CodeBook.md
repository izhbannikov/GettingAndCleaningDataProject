---
title: "Codebook for the \"Getting and Cleaning Data\" class project"
author: "Ilya Y. Zhbannikov"
date: "2015-10-23"
output:
  html_document:
    keep_md: yes
---

## Project Description
This is a Coursera "Getting and Cleaning Data" class project. This project is about tidy data preparation for using it in subsequent downstream analysis.

##Study design and data processing

###Collection of the raw data

Below there is a citation from the project site (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones):

\"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.\"


##Creating the tidy datafile

###Guide to create the tidy data file

These are steps to create the tidy data files:

1. Download the raw data.
2. Merge the training and the test sets in order to create one data set.
3. Extract the measurements on the mean and standard deviation for each measurement.
4. Use descriptive activity names to name the activities in the data set.
5. Appropriately label the data set with descriptive variable names.
6. From the data set in step 5, create a second, independent tidy data set with the average of each variable for each activity and each subject.

###Cleaning of the data

Cleaning script ```run_analysis.R``` performs those steps of getting a tidy data shown above.
For more information, please see README file.

##Description of the variables in the tiny_data.txt file

###activity
Activity name.

* Class: character
* Values: walking, walking_upstairs, walking_downstairs, sitting, standing, laying
* Unit of measurement: None


###subjectId
Subject Id. 

* Class: numeric
* Values: from 1 to 30
* Units: None

###Other variables

Signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* t: denotes time domain
* f: denotes frequency domain

These are all numeric variables.

####t,fBodyAccmeanX,Y,Z
Mean value for linear body acceleration for X, Y, Z axes.

####t,fBodyAccstdX,Y,Z
Statdard deviation value for linear body acceleration for X, Y, Z axes.

####t,fGravityAccmeanX,Y,Z
Mean value for gravity body acceleration for X, Y, Z axes.

####t,fGravityAccstdX,Y,Z
Statdard deviation value for gravity body acceleration for X, Y, Z axes.

####t,fBodyAccJerkmeanX,Y,Z
Mean value for jerk acceleration for X, Y, Z axes.

####t,fBodyAccJerkstdX,Y,Z
Statdard deviation value for jerk acceleration for X, Y, Z axes.

####t,fBodyGyromeanX,Y,Z
Mean value for body gyroscope 3-axial signal.

####t,fBodyGyrostdX,Y,Z
Statdard deviation value for body gyroscope 3-axial signal.

####t,fBodyGyroJerkmeanX,Y,Z
Mean value for jerk gyroscope 3-axial signal.

####t,fBodyGyroJerkstdX,Y,Z
Statdard deviation value for jerk gyroscope 3-axial signal.

####t,fBodyAccMagmean
Mean value for body linear magnitude signal.

####t,fBodyAccMagstd
Statdard deviation value for body linear magnitude signal.

####t,fGravityAccMagmean
Mean value for body gravity magnitude signal.

####t,fGravityAccMagstd
Statdard deviation value for body gravity magnitude signal.

####t,fBodyAccJerkMagmean
Mean value for jerk gravity magnitude signal.

####t,fBodyAccJerkMagstd
Statdard deviation value for jerk gravity magnitude signal.

####t,fBodyGyroMagmean
Mean value for body gyroscope magnitude signal.

####t,fBodyGyroMagstd
Statdard deviation value for body gyroscope magnitude signal.

####t,fBodyGyroJerkMagmean
Mean value for jerk gyroscope magnitude signal.

####t,fBodyGyroJerkMagstd
Statdard deviation value for jerk gyroscope magnitude signal.


##Sources
Human Activity Recognition Using Smartphones Data Set Project: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#