##Study Design
Source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

##Code Book
###Variable naming conventions
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

The variables ending in "mean" represent the mean values of the specified signal. Variables ending in "std" represent the standard deviation. 

The data presented in this table is the average value for an activity (across all subjects), or the average values for a subject (across all activities).


###Variable list and (units)
activity: (none) one of 6 activities performed by subjects. If "ALL", then all 6 activity types are averaged in the row. 

subject: (none) subject ID number. If "ALL", then all subjects are averaged in the row. 

tBodyAccmeanX: (Hz)
tBodyAccmeanY: (Hz)
tBodyAccmeanZ: (Hz)
tBodyAccstdX: (Hz)
tBodyAccstdY: (Hz)
tBodyAccstdZ: (Hz)
tGravityAccmeanX: (Hz)
tGravityAccmeanY: (Hz)
tGravityAccmeanZ: (Hz)
tGravityAccstdX: (Hz)
tGravityAccstdY: (Hz)
tGravityAccstdZ: (Hz)
tBodyAccJerkmeanX: (Hz)
tBodyAccJerkmeanY: (Hz)
tBodyAccJerkmeanZ: (Hz)
tBodyAccJerkstdX: (Hz)
tBodyAccJerkstdY: (Hz)
tBodyAccJerkstdZ: (Hz)
tBodyGyromeanX: (Hz)
tBodyGyromeanY: (Hz)
tBodyGyromeanZ: (Hz)
tBodyGyrostdX: (Hz)
tBodyGyrostdY: (Hz)
tBodyGyrostdZ: (Hz)
tBodyGyroJerkmeanX: (Hz)
tBodyGyroJerkmeanY: (Hz)
tBodyGyroJerkmeanZ: (Hz)
tBodyGyroJerkstdX: (Hz)
tBodyGyroJerkstdY: (Hz)
tBodyGyroJerkstdZ: (Hz)
tBodyAccMagmean: (Hz)
tBodyAccMagstd: (Hz)
tGravityAccMagmean: (Hz)
tGravityAccMagstd: (Hz)
tBodyAccJerkMagmean: (Hz)
tBodyAccJerkMagstd: (Hz)
tBodyGyroMagmean: (Hz)
tBodyGyroMagstd: (Hz)
tBodyGyroJerkMagmean: (Hz)
tBodyGyroJerkMagstd: (Hz)
fBodyAccmeanX: (Hz)
fBodyAccmeanY: (Hz)
fBodyAccmeanZ: (Hz)
fBodyAccstdX: (Hz)
fBodyAccstdY: (Hz)
fBodyAccstdZ: (Hz)
fBodyAccJerkmeanX: (Hz)
fBodyAccJerkmeanY: (Hz)
fBodyAccJerkmeanZ: (Hz)
fBodyAccJerkstdX: (Hz)
fBodyAccJerkstdY: (Hz)
fBodyAccJerkstdZ: (Hz)
fBodyGyromeanX: (Hz)
fBodyGyromeanY: (Hz)
fBodyGyromeanZ: (Hz)
fBodyGyrostdX: (Hz)
fBodyGyrostdY: (Hz)
fBodyGyrostdZ: (Hz)
fBodyAccMagmean: (Hz)
fBodyAccMagstd: (Hz)
fBodyBodyAccJerkMagmean: (Hz)
fBodyBodyAccJerkMagstd: (Hz)
fBodyBodyGyroMagmean: (Hz)
fBodyBodyGyroMagstd: (Hz)
fBodyBodyGyroJerkMagmean: (Hz)
fBodyBodyGyroJerkMagstd: (Hz)