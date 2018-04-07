# download the input dataset file and unzip it
url = 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
zfname <- "ds.zip"
download.file(url,zfname)
unzip(zfname)

if (!file.remove(zfname)) {
	message(paste("Failed to remove zip file:",zfname));
}

setwd("./UCI HAR Dataset")

library(plyr)

# read the features and activities tables
feats <- read.table("features.txt")
actvs <- read.table("activity_labels.txt")

# read the test and training measure scores
testm <- read.table("test/X_test.txt")
trainm <- read.table("train/X_train.txt")

# get the list of measurements we want to keep, only means and standard deviations
fkeep <- grep("-(mean|std)\\(\\)",feats[,2])
fnames <- feats[,2][fkeep]
# remove any non-alphnumeric characters from the feature measure names
fnames <- gsub("\\W","",fnames)

# only keep the columns we want
testm <- testm[fkeep]
trainm <- trainm[fkeep]

# prepend with subject and activity columns
testm <- cbind(read.table("test/subject_test.txt"),
	       read.table("test/y_test.txt"),
	       testm)
trainm <- cbind(read.table("train/subject_train.txt"),
	        read.table("train/y_train.txt"),
	        trainm)

# combine the test and training data sets
totalm <- rbind(trainm,testm)

# change table columns to descriptive names
names(totalm) <- c("subject","activity",fnames)
# map activity column to descriptive names
totalm$activity <- mapvalues(totalm$activity,from=actvs[,1],to=as.character(actvs[,2]))

# create second table with measure averages of each variable grouped by subject and activity
avebyact <- ddply(totalm,.(subject,activity),numcolwise(mean))

# write average table to file
setwd("../")
fname <- "\'tidy_data.txt\'"
message(paste("Writing output date file:",fname))
write.table(avebyact,file="tidy_data.txt",row.names=FALSE)
