Step of the work of script:

1. Reads the train data from the "train" folder
2. Reads the test data from the "test" folder
3. Merges the train data with test data to dataX, dataY and dataSubject variables
4. Cleans memory from test and train data, as it wouldn't be used anymore
5. Further it assignes names to data columns:
  1. For dataX it uses names from features.txt
  2. For dataY it uses name "activity". Script also substitutes actual names of activities from activity_labels.txt instead of coded id's
  3. For dataSubject script uses name "subject"
6. Script derives indexes of columns with -std() or -mean() at the end of name, using grep on the array on names of dataX.
7. Finaly script bind columns from dataY, dataSubject and columns from dataX, that have -std() or -mean() at the end of its name.
8. The dataframe from step 7 is put into tidy_data_means_and_stddevs.txt using write.table
