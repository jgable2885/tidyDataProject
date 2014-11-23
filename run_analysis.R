#Download and upzip the data file if it doesn't already exist
if(!file.exists("data.zip")){
        downloadDate <- Sys.time()
        download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ",
                      destfile="data.zip",method="curl")
        unzip("data.zip")
}

#load training set labels
trainYCon <- file("./UCI HAR Dataset/train/y_train.txt")
trainY <- readLines(trainYCon)
close(trainYCon)

#load training set
trainingSet <- read.table("./UCI HAR Dataset/train/X_train.txt",sep="")
#load features list
featuresList <- read.table("./UCI HAR Dataset/features.txt")
#assign feature names to column names
colnames(trainingSet) <- featuresList$V2
#make new column with label values
trainingSet$activity <- trainY
#read training set data
trainingSubjectList <- read.table("./UCI HAR Dataset/train/subject_train.txt")
#make new column with subjects as integers
trainingSet$subject <- trainingSubjectList[[1]]

#load test set labels
testYCon <- file("./UCI HAR Dataset/test/y_test.txt")
testY <- readLines(testYCon)
close(testYCon)

#load test set
testingSet <- read.table("./UCI HAR Dataset/test/X_test.txt",sep="")
#assign feature names to column names
colnames(testingSet) <- featuresList$V2
#make a new column with label values
testingSet$activity <- testY
#read test set subject list
testingSubjectList <- read.table("./UCI HAR Dataset/test/subject_test.txt")
#make a new column with subject as integers
testingSet$subject <- testingSubjectList[[1]]

#combine the training and test sets by adding 
allData <- rbind(trainingSet,testingSet)

#read in activity names and their corresponding numbers
activitiesTable <- read.table("./UCI HAR Dataset/activity_labels.txt")
#convert label numbers into descriptive activity names
allData$activity <- activitiesTable$V2[match(as.numeric(allData$activity),as.numeric(activitiesTable$V2))]

#extract mean and standard deviation values of measurements
meansAndStdevs <- allData[,grep("mean\\(\\)|std\\(\\)|activity|subject",colnames(allData))]
#reorder the data frame so that "subject" and "label" are the first two rows
meansAndStdevs <- meansAndStdevs[,c(length(meansAndStdevs),(length(meansAndStdevs)-1),1:(length(meansAndStdevs)-2))]

averagesByActivityAndSubject <- ddply(meansAndStdevs,.(subject,activity),numcolwise(mean))

