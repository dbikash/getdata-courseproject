# getdata-courseproject
Course Project of "Getting and Cleaning Data" course by Coursera-JHU

I provide here a R script run_analysis.R that transforms the Samsung data as per the Course Project instructions into a tidy data set summarizing the data by Subject and Activity.

## Assumptions
It is assumed that:

1. The working directory contains, in addition to run_analysis.R, the entire dataset unzipped (i.e. a folder named "UCI HAR Dataset", containing "test" and "train" directories and other files).
2. The dplyr package is installed.

## Repository Contents

1. run_analysis.R: The R script that transforms data and presents a tidy summary as per the Course Project requirement.
2. Codebook.md: The code book that explains the steps performed on the original data set to get the final result, along with an explanation of the intermediate variables in the transformation and final variables in the result data set.
3. README.md: This file.

The result data set is uploaded separately through the Coursera Course Project page and is not included in this repository.

## How to run
1. Download run_analysis.R to a location in your computer.
2. Unzip the source data set in this location. This should give a folder named "UCI HAR Dataset", containing "test" and "train" directories and other files.
3. Open R console or R studio and set your working directory to this location using setwd()).
4. Verify that package dplyr is installed.
5. Run run_analysis.R.

NOTE: I have run this R script in R Studio on a Windows 7 machine. If you are using a Linux or Mac, please modify the path names in run_analysis.R appropriately (e.g. front slashes instead of back slashes etc.).

## Output
The output of the script is "tidy_data", a data frame converted to a grouped tbl_df for dplyr operations. After the script finishes, it opens up a view of the tidy data (you may also examine it in R).



