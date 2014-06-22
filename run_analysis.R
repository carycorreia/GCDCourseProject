## Course Project of Getting and Cleaning Data
## ZiShen Lv, lzs24@msn.cn  2014-06

######################################################################
## set some useful variables
## load data
######################################################################
## set data folder
rootfolder <- "E:/UCI HAR Dataset"
## set train folder and test folder
traindir <- paste(rootfolder, "/train", sep="")
testdir <- paste(rootfolder, "/test", sep="")
# train data set
train.X <- read.table(paste(traindir, "/X_train.txt", sep=""))
train.y <- read.table(paste(traindir, "/y_train.txt", sep=""))
train.subject <- read.table(paste(traindir, "/subject_train.txt", sep=""))
# test data set
test.X <- read.table(paste(testdir, "/X_test.txt", sep=""))
test.y <- read.table(paste(testdir, "/y_test.txt", sep=""))
test.subject <- read.table(paste(testdir, "/subject_test.txt", sep=""))
# other data
activity_labels <- read.table(
  paste(rootfolder, "/activity_labels.txt", sep=""),
  colClasses="character")
features <- read.table(paste(rootfolder, "/features.txt", sep=""))

######################################################################
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation 
## for each measurement. 
######################################################################
all.X <- rbind(train.X, test.X)
all.y <- rbind(train.y, test.y)
all.subject <- rbind(train.subject, test.subject)
# set the table column names for all.X
colnames(all.X) <- features[,2]
meanindex <- grep("mean()", colnames(all.X), fixed=T)
stdindex <- grep("std()", colnames(all.X), fixed=T)
selectedpart <- all.X[,c(meanindex, stdindex)]


######################################################################
## 3. Uses descriptive activity names to name the activities in the 
## data set
## 4. Appropriately labels the data set with descriptive variable names. 
######################################################################
all.activityappended <- cbind(all.y,selectedpart)
colnames(all.activityappended)[1] <- "activity"
for(i in 1:nrow(all.activityappended)){
  all.activityappended[i,1] <- activity_labels[all.activityappended[i,1],2]
}


######################################################################
## 5. Creates a second, independent tidy data set with the average of 
## each variable for each activity and each subject. 
######################################################################
all <- cbind(all.subject, all.activityappended)
colnames(all)[1] <- "subject"
result <- aggregate( all[,3] ~ subject+activity, data = all,
                     FUN= "mean" )
for(i in 4:ncol(all)) {
  result[,i] <- aggregate( all[,i] ~ subject+activity,
                         data = all, FUN= "mean" )[,3]
}
colnames(result)[3:ncol(result)] <- colnames(selectedpart)
write.table(result, file = "ResultDataSet.txt")




