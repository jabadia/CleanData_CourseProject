# Course Project
For [Getting and Cleaning Data](https://class.coursera.org/getdata-010) course in Coursera

## Files in the repo

- [README.md](README.md), this file
- [CodeBook.md](CodeBook.md), explanation of output file content, observations and variables
- [run_analysis.R](run_analysis.R), script to convert input into output

## How to run

### Pre-requisites

In order to succesfully generate `output.txt` you need:

- a current version of R or R-Studio (tested with **R version 3.1.2 (2014-10-31) -- "Pumpkin Helmet"**, no reason it shouldn't work on earlier versions)
- the input files as downloaded from the [course site](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), and uncompressed in a working folder
- set the R working directory to the folder that contains the uncompressed archive `setwd('<your working dir here>/UCI_HAR_Dataset')`

### Running the script

Simply source the script file and execute the `run_analysis()` function

	source('<path-to-script>/run_analysis.R')
	setwd('<your working dir here>/UCI_HAR_Dataset')	
	data <- run_analysis()

You can specify two optional parameters to `run_analysis()`

- `nrows`: will limit input read to the specified number of rows in each read file. It is useful while testing the function with smaller subsets of data for faster execution time. If you don't specify this parameter, the function will read all rows
- `output.name`: name of file to write the summary table to. Defaults to `output.txt`

### Return Value

The `run_analysis()` returns a list with two values:

- `data`: contains the tidy data: one row for each observation, and one column for each variable. See [CodeBook.md](CodeBook.md) file for an explanation of observations and variables
- `summary`: contains the summarized data set (mean of each column grouped by activity)

It also writes an `output.txt` file described below

### Output content

See [CodeBook.md](CodeBook.md) file for an explanation of observations and variables
