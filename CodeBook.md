# CodeBook for Course Project
For [Getting and Cleaning Data](https://class.coursera.org/getdata-010) course in Coursera

## Input Data
As specified in README.txt, features.txt and features_info.txt files inside the [compressed data archive](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

- There are two datasets with the same structure: test and train
- For each dataset, we have two interesting files: X_test|X_train and y_test|y_train
- In X_test|X_train we have one row for each feature vector.
- For each of the features in X_test|X_train files, we have exactly 561 columns, each one corresponding to one variable that describes the feature
- The file features.txt contains the name of each of the 561 variables. For instance, the 4th column of X_test|X_train is the 'tBodyAcc-std()-X' variable
- In y_test|y_train files, we have the same number of rows for each feature
- Each row contains one integer that labels what activity does the corresponding feature vector in X files represents. The meaning of these integers can be found in the `activity_labels.txt` file

## Processing

When running the `run_analysis()` function, we do the follwing steps:

1. We read the reference files into data.frames: `features.txt` and `activity_labels.txt`
2. We read actual data from the four interesting files: `test/X_test.txt`, `test/y_test.txt`, `train/X_train.txt` and `train/y_train.txt`.
3. We stitch together test and train datasets into X_data and y_data using `rbind()`
4. We select relevant columns from the X_data dataset, by looking at which column names contain the substring `mean()` or `std()`, using `grep()` function
5. We replace activity integers by their actual labels (as a Factor)
6. We stitch together X and y datasets using `cbind()`
7. We, finally, compute the summary of the resulting dataset using `aggregate()`

## Outputs

The function `run_analysis()` writes an output.txt file with the content of the summary dataset and returns a list with two elements: data and summary, containing the whole processed dataset and the tidy summary

In the `data` dataset, there is:
- 1 row for each feature vector
- 1 column with the activity label (first column)
- 66 columns with the feature variable values, selected from the complete input dataset. Only those columns that contain `mean()` or `std()` are retained

In the `summary` dataset (and also in the `output.txt` file), there is:
- 1 row for each of the 6 activity types
- 1 column with the activity label (first column)
- 66 columns with the mean value of all variables for all observations of that activity type

