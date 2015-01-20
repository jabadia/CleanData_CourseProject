# Course Project
## Getting and Cleaning Data
[link to course](https://class.coursera.org/getdata-010)

## Files in the repo

- [README.md](README.md), this file
- [CodeBook.md](CodeBook.md), explanation of output file content, observations and variables
- [run_analysis.R](run_analysis.R), script to convert input into output

## How to run

### Pre-requisites

In order to succesfully generate `output.txt` you need:

- an updated version of R or R-Studio
- the input files as downloaded from the [course site](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), and uncompressed in a working folder
- set the R working directory to the folder that contains the uncompressed archive `setwd('<your working dir here>/UCI_HAR_Dataset')`

### Running the script

Simply source the script file and execute the function run_analysis() function

	source('<path-to-script>/run_analysis.R')
	setwd('<your working dir here>/UCI_HAR_Dataset')	
	run_analysis()

### Output content

See CodeBook.md file for an explanation of observations and variables
