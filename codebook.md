#Codebook for *run_analysis.R* output using the UCI HAR dataset version 1.0

####The following was adapted from [features_info.txt](https://github.com/jgable2885/tidyDataProject/blob/master/features_info.txt) provided with the original UCI HAR dataset. Direct quotes are indicated by italics.

*Feature Selection*

*The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.*

*Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).**

*Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).*

*These signals were used to estimate variables of the feature vector for each pattern:* 
*'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.*

- *tBodyAcc-XYZ*
- *tGravityAcc-XYZ*
- *tBodyAccJerk-XYZ*
- *tBodyGyro-XYZ*
- *tBodyGyroJerk-XYZ*
- *tBodyAccMag*
- *tGravityAccMag*
- *tBodyAccJerkMag*
- *tBodyGyroMag*
- *tBodyGyroJerkMag*
- *fBodyAcc-XYZ*
- *fBodyAccJerk-XYZ*
- *fBodyGyro-XYZ*
- *fBodyAccMag*
- *fBodyAccJerkMag*
- *fBodyGyroMag*
- *fBodyGyroJerkMag*


The corresponding mean and standard deviation values were estimated and included in the original set as follows:

- *mean(): Mean value*
- *std(): Standard deviation*

run_analysis.R averages the means and standard deviations by activity and subject (e.g. the average tBodyAcc-X for subject 1 while walking, or the average tBodyAcc-Y for subject 5 while standing). **Names and units used in the original dataset are retained.**




The complete list of variables of each feature vector for the original data set is available in [features.txt](https://github.com/jgable2885/tidyDataProject/blob/master/features.txt)
