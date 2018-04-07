# CodeBook for run_analysis.R

# Introduction

This CodeBook file describes the steps implemented within the run_anlaysis.R script. The objective of the
run_analysis.R script is to download personal wearable data measures obtained so it can be cleaned and
transformed into tiday data. The resulting tiday data file is written out as a result of this script.

# Steps

## Downloading Input Files
The first step is to download the data set zip file from the link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

into the *ds.zip* file in the current working directory the run_analysis.R script was executed from.
The content of the zip file is extracted into the current working directory.

## Loading Relevant Data Sets

The current working directory is changed to the extracted data set directory "*UCI HAR Dataset*".
The data table files read are:

1. features.txt             // table of the feature names of the measurements collected
2. activity_labels.txt      // table of the various activity names (e.g. WALKING,SITTING,..)
3. test/X_test.txt          // table of collected data for each feature in features.txt for the **test** run
4. test/y_test.txt          // table of activity ids, one for each row of the X_test measurements
5. test/subject_test.txt    // table of subject ids, one for each row of the X_test mesurements
6. train/X_test.txt         // these 3 tables contains the same information as above but for the **training**
7. train/y_test.txt         // run
8. train/subject_test.txt   //

## Selecting only Variables of Interest

From the test/X_test.txt and train/X_test.txt data tables, only keep the column feature names containg either
"*-mean()*" or "*-std()*". These variables are the means and stand deviations of the feature measures we are
interested in.

## Merging data sets together

Merge the subject, activity and collected data tables into one table with Subject and Activity as the new two
left most column variables. Do this for the test and the train data tables. These two combined tables will have
the exact same column variables. Merge this two tables into one total table.

## Cleaning variable names and make values more descriptive

The Activity column contains activity id values (1-6). Make this information more descriptive by mapping the id values
their actual activity names (e.g. WALKING) using the data frame created from activity_labels.txt.

Also clean the feature column variable names by removing any non-alphanumeric characters. For example: tBodyAcc-mean()-X becomes
tBodyAccmeanX.

## Create a tidy summary data file

Take the merged and cleaned table generated from above, from a *tidy* table by groupig the observations by Subject
and Activity. For the resulting feature measure groups for each Subject and Activity, report the mean values for each
feature.

## write the tidy data out into a file

The resutling summary data frame from above is written out to the file name **tidy_data.txt** in the current working directory.
