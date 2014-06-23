Getting-and-Cleaning-Data
=========================

Getting and Cleaning Data Coursera Course Project
Project contains Clean-Data.R script that parses data from Samsung
smartphoneaccelerometerand reshapes it in appropriate way.
Script is written in R, so to run it you need to intall R language distribution
from: http://cran.r-project.org/
Script does not depend on any R packages aside from base installation

To run this script you need to do the following:

1. Download archive with data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Unzip this archive anywhere on you computer.
3. Put the script near features.txt in the folder named "UCI HAR Dataset"(without quotes) inside of that archive.
4. Launch R instance on your computer
5. Set the working directory of R instance to the folder, where you'd put the script on the step 3
6. Run the script with
```R
source("../Clean_Data.R")
```
At the end of the work you will get two file in the same folder, where the script is: tidy_data_means_and_stddevs.txt (around 9.9 Mb) and tidy_data_means_of_all_columns.txt (around 1.9 Mb). Both file contain data, that can be read with read.table function and used for the futher research.
Script usually takes around 40 seconds to run, but this time may vary, depending on your machine.
