Step of the work of script:

1. Reads the train data from the "train" folder
2. Reads the test data from the "test" folder
3. Merges the train data with test data to dataX, dataY and dataSubject variables
4. Cleans memory from test and train data, as it wouldn't be used anymore
5. Further it assignes names to data columns:
  1. For dataX it uses names from features.txt
  2. For dataY it uses name "activity". Script also substitutes actual names of activities from activity_labels.txt instead of coded id's
  3. For dataSubject script uses name "subject"
6. Script derives indexes of columns with -std() or -mean() in their name, using grep on the array on names of dataX.
7. Finaly script bind columns from dataY, dataSubject and columns from dataX, that have -std() or -mean() at their name.
8. The dataframe from step 7 is put into **tidy_data_means_and_stddevs.txt** using write.table
9. dataY, dataSubject and dataX are binding to one data.frame
10. using aggregate function this script separates data using activity and subject values and applys mean function to the subsets.
11. The result is saved to **tidy_data_means_of_all_columns.txt** with write.table function

Data in **tidy_data_means_and_stddevs.txt** is 10299x81 dataframe of the following structure:
- The first column is activity - type = "charaster" Contains the following values:
  - WALKING
  - WALKING_UPSTAIRS
  - WALKING_DOWNSTAIRS
  - SITTING
  - STANDING
  - LAYING
- The second column is subject number - type = "integer". Contains values from 1 to 30
- All other column are means and standart deviations of various measures. They have "numeric" data type.

Data in **tidy_data_means_of_all_columns.txt** is 180x561 dataframe. The structure of almostly the same:
- The first column is activity - type = "charaster" Contains the following values:
  - WALKING
  - WALKING_UPSTAIRS
  - WALKING_DOWNSTAIRS
  - SITTING
  - STANDING
  - LAYING
- The second column is subject number - type = "integer". Contains values from 1 to 30
- All other column various measures. They have "numeric" data type.

For the meaning of numeric measures you should read http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and features-info.txt from the archive with data.
