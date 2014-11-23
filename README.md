#README for run_analysis.R
####Getting and Cleaning Data (Johns Hopkins University, Coursera)
*run_analysis.R* downloads (if not already present) and analyses the UCI Human Activity Recognition Using Smartphones Dataset Version 1.0. 

Overall, this script loads and combines the training and test set data generating a new data frame containing only the means and standard deviations of measurements. This new data frame also integrates descriptive activity names (e.g. WALKING), descriptive column names (e.g. tBodyAcc-mean()-X), and subject IDs as additional columns. Using the means and standard deviations extracted from the original data sets, a new tidy dataset is generated containing the average of each variable for each activity and each subject. A detailed description of the processing is below.

**A codebook describing the feature list (column names) can be found at http://**

####Description of data processing:
If not already present, data are downloaded and unzipped into the working diretory, generating a new folder 'UCI HAR Dataset'.

For each dataset (training and test sets) the following is carried out:
1. Labels are loaded from *y_train.txt* or *y_test.txt*
2. Data are loaded from *X_train.txt* or *X_test.txt* as data frames
3. A descriptive list of features in the datasets is loaded from *features.txt* and assigned to the column names of each dataset (fromm step 2)
4. A new column with activity label values (from step 1) is added to the dataset
5. Subject lists are loaded from *subject_train.txt* and *subject_test.txt* and assigned to a new column in the data frame named 'subject'

At the end of this process the script has produced two data frames containing the test set and training set data with new columns for activity labels and subjects.

These two data frames are combined using the row bind command. Numbers in the 'Label' column are replaced with descriptive names from the *activity_labels.txt* file. Grep is used to extract only those columns which have names containing 'mean()' or 'std()' in addition to the 'activity' and 'subject' columns. The 'activity' and 'subject' columns are moved to the leftmost positions of the data frame for ease of reading.

Using *ddply()* means are taken by 'subject' and 'activity' using the *numcolwise(mean)* function from *plyr* as the '.fun' parameter in *ddply()*.

This final data frame constitutes a tidy data set: each variable (e.g. tBodyAcc-mean()-X)  is in one column and each different observation of that variable (e.g. the mean of a variable for subject 1 while walking) is in a different row.

