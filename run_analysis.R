#This program assumes that:
# 1. The zip file has already been downloaded from the course website
# 2. The zip file has been unpacked
# 3. The files are stored in their original structure and the UCI HAR Dataset
#    folder is the working directory

# READ DATA FILES
# NOTE: Intertial Signals are not being loaded. See README for an explanation.
# Test data
Xtest <- read.table("./test/X_test.txt")
ytest <- read.table("./test/y_test.txt")
subtest <- read.table("./test/subject_test.txt")

# Training data
Xtrain <- read.table("./train/X_train.txt")
ytrain <- read.table("./train/y_train.txt")
subtrain <- read.table("./train/subject_train.txt")

# Feature information
Xfeatures <- read.table("./features.txt")
yfeatures <- read.table("./activity_labels.txt")


# COMBINE TEST & TRAIN
allTest <- data.frame(ytest, subtest, Xtest)
allTrain <- data.frame(ytrain, subtrain, Xtrain)

# Stack the two tables
DF <- rbind(allTest, allTrain)


# NAME COLUMNS
colnames(DF) <- c("activity", "subject", sapply(Xfeatures$V2, as.character))


# FIND MEAN AND STANDARD DEVIATION
# NOTE - this explicity ignores data that includes the text -meanFreq(). 
# See the README for an explanation. 
colidx <- grep("-mean[^Freq]()|-std()", names(DF))

# Now add in the subject and activity columns so they're not removed
colidx <- c(1,2,colidx)

# Remove all columns that are not in our new index
DF <- DF[,colidx]


# RENAME ACTIVITY LABELS
# Merge in column labels
mergeDF <- merge(yfeatures, DF, by.x = "V1", by.y = "activity")
mergeDF$V2 <- as.character(mergeDF$V2)

# Remove the column of numbers and rename the labels as "activity"
library(plyr)
mergeDF  <- rename(mergeDF, c("V2" = "activity"))
DF <- mergeDF[,2:length(mergeDF)]

# CLEAN UP COLUMN NAMES
#Here we will remove () and - because they are unnecessary to the name. 
colnames(DF) <- gsub("-|\\(\\)","",names(DF)) 

# CREATE TIDY DATA SET
library(reshape2)

# Melt data frame
DFmelt <- melt(DF, id.vars = c("activity","subject"))

# Cast two data frames: subject and activity. Add "ALL" in the respective
# missing column for each
subjCast <- dcast(DFmelt, subject ~ variable,mean)
addcol <- data.frame(activity = rep("ALL",dim(subjCast)[1]), stringsAsFactors = FALSE)
subjCast <- cbind(addcol, subjCast)

actCast <- dcast(DFmelt, activity ~ variable,mean)
addcol <- data.frame(subject = rep("ALL",dim(actCast)[1]), stringsAsFactors = FALSE)
actCast <- cbind(actCast[1],addcol,actCast[,2:length(actCast)])

# Create tidy data set by stacking the two data frames we just created
tidyDF <- rbind(actCast, subjCast)

# Write the tidy data set to a txt file (change to .csv to write a csv)
write.table(tidyDF, "./tidyData.txt", sep = ",", row.names = FALSE)

# Let you know the file has been created
print("File 'tidyData.txt' created in active directory")