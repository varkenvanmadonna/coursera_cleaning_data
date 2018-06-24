# Getting and cleaning data course project Coursera
## Background
 
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare Youtidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project.  We are required to submit: 
* 1) a tidy data set as described below, 
* 2) a link to a Github repository with your script for performing the analysis, and 
* 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
*a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

## The required data

* The data can be retrieved from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* it contains IoT recordings of data coming from fitness devices worn by subjects
* When downloading and unzipping this file, a directory called " UCI HAR Dataset" will appear. 
* This directory contains a readme file and a feature info file. These files are FYI
* The directory also contains a file called "activity_labels.txt". This file contains descriptions of activities
* The file called "features.txt" actually contains column names for the training and test files
* Within this directory, you will find 2 other directories : test and train
* The both have a subject_.. file and an X.. file and a y.. file. 
* The subject file contains a vector of numbers corresponding with the 30 subjects in this test.  The subject file will need to be added to the final file
* The X_.. file contains training or testing measures.  The column names for this data can be found in the features file
* the y_..file contains numbers from 1 to 6 corresponding with the activity types
* 1 WALKING
* 2 WALKING_UPSTAIRS
* 3 WALKING_DOWNSTAIRS
* 4 SITTING
* 5 STANDING
* 6 LAYING

## Content of this repo

# first of all, the repo contains a script called "Run_analysis.R" 
If you open the script you will find that this script takes the files described above and performs a number of operations on it
* It helps you download the necessary files if you don't have them already
* It loads all relevant files into R
* It merges the training and test data together
* Then it adds the subject data and the activity data to the main training set
* it also introduces the proper activity descriptions rather than having to use numbers
* it then subsets the columns to only contain subject, activity and mean and standard deviation related data
* After which it averages the data for all columns, grouped by activity and by subject

# The repo contains a file, which is the final out put of the averaged data described above
* The file is called "average_data.csv" . It is in CSV format

# A Codebook describing the content of "average_data.csv" 

* the codebook provides meta-information about the data attributes in the document
* The name of the codebook is CodeBook.Rmd
* This codebook is dynamic and will reflect the current layout of the average_data.csv file ( or at least the code behind it)



