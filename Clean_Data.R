# Read train data
trainDataX <- read.table("train/X_train.txt",colClasses = "numeric")
trainDataY <- read.table("train/y_train.txt",colClasses = "integer")
trainDataSubject <- read.table("train/subject_train.txt",colClasses = "integer")

# Read test data
testDataX <- read.table("test/X_test.txt",colClasses = "numeric")
testDataY <- read.table("test/y_test.txt",colClasses = "integer")
testDataSubject <- read.table("test/subject_test.txt",colClasses = "integer")

# Merge train and test data
dataX <- rbind(trainDataX,testDataX)
dataY <- rbind(trainDataY,testDataY)
dataSubject <- rbind(trainDataSubject,testDataSubject)

# Delete data, that is not needed anymore
rm(testDataX)
rm(trainDataX)
rm(testDataY)
rm(trainDataY)
rm(testDataSubject)
rm(trainDataSubject)

# Read features names and assign them to dataX
features <- read.table("features.txt", colClasses=c("integer","character"))
names(features) <- c("id", "name")
names(dataX) <- features$name

# Read activity names and assign them to dataY
activities <- read.table("activity_labels.txt", colClasses=c("integer","character"))
names(activities) <- c("id", "name")
names(dataY) <- c("activity")
dataY$activity <- activities[dataY$activity, "name"]

# Assign name to dataSubject
names(dataSubject) <- c("subject")

# Get column numbers of means and standard deviations using grep
meanAndStdDevNames <- grep("-mean()|-std()", names(dataX))

# Bind columns
tidyData1 <- cbind(dataY, dataSubject, dataX[,meanAndStdDevNames])
write.table(tidyData1,"tidy_data_means_and_stddevs.txt")

# Create another tidy data set
tidyData2 <- cbind(dataY, dataSubject, dataX)

# using aggregate to compute mean for subsets of activity-subject pairs
tidyData2 <- aggregate(tidyData2[, 3:ncol(tidyData2)],
                                by=list(activity=tidyData2$activity,
                                        subject=tidyData2$subject),
                                FUN=mean)
write.table(tidyData2,"tidy_data_means_of_all_columns.txt")
