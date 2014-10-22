#Coursera tidy data project 
To look at the ouptup of run_analysis.R, read the file into R using read.csv    
Example code: tidyData <- read.csv("./tidyData.csv")

This program assumes that:  
1. The zip file has already been downloaded from the course website     
2. The zip file has been unpacked  
3. The files are stored in their original structure and the UCI HAR Dataset folder is the working directory  

Here are the step-by-step actions the code takes:  
####1. READ DATA FILES
An important note here is that the Intertial Signals files are not loaded. They were provided as the raw data used to calculate all of the features; in this case we are interested in processing the features themselves. We will not be redoing the filtering and other data processing already performed to generate the feature set, so the Inertial Signal files may safely be ignored.

1a. Load the test data  
1b. Load the training data  
1c. Load the feature information  

All of the raw data files should now be in the R workspace. 

####2. COMBINE TEST & TRAIN
There are several ways to stack these two tables, including rbind(), sqldf()
and rbindlist() (if we were using data tables instead of data frames). These two data sets are small enough that rbind() is efficient.


####3. NAME COLUMNS
Next we label the columns of the data table so that we can use regular expressions to pull the mean and standard deviation. The columns are named using the features list loaded previously. 

####4. FIND MEAN AND STANDARD DEVIATION
The next step is to remove all of the columns that are unrelated to the mean and standard deviation of the feature set (as specified in the problem statement). 

The first important note here is that this code explicity ignores data that includes the text "-meanFreq()". We want the mean and standard deviation of EACH measurement. The mean frequency is the 'weighted average of the frequency components', not the mean of the measurement value. This code also ignores the set of calculated values on the end that were obtained by 'averaging the values in a signal window sample'. These are not mean values for the raw measurements either. 

The regular expression used in the code searches for all mean values that do not include "Freq" OR values that include std. Therefore one expression is sufficient to return the indexes of all relevant columns. 

Finally, we add in the subject and activity columns to the index so they're not removed, then filter the data frame to only include our index values.


####5. RENAME ACTIVITY LABELS
We will now rename the values in the 'activity' column with descriptive values.The data set provided these values in the 'activity_labels.txt' file, and they are sufficiently descriptive. We use the merge command here, noting that the table may be reordered (it does not matter since all the records are already stitched together).

The other code in this section cleans up the table a bit by renaming the column headers and removing the column of numbers used for the merge.


####6. CLEAN UP COLUMN NAMES
The column names are pretty descriptive already, but are already a bit long. The abbreviations will therefore not be expanded further. See the code book for the explanation of any abbreviations. Here we will remove "()" and "-" because they are unnecessary to the name. Uppdercase letters are kept to improve readability. Once again this can be accomplished in a single line.


####7. CREATE TIDY DATA SET
We want to find the average of each mean/std variable for each activity and each subject. Then we want to combine the two datasets such that they make sense--here by including "ALL" in the column that is averaged over (e.g. each activity will average over ALL subjects).

The code therefore chooses "activity" and "subject" as ids, and melts the rest. Then we can cast two data frames: subject and activity. Finally, we add "ALL" in the respective missing column for each so that they can be combined into one data set in a readable fashion.

The two data frames are stacked using rbind(). Then the final tidy data set is written to a text file (because that is the required format), but can easily be written to a .csv as well.