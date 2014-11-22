#as per tidy data slide - list of variables (all other variables are cleaned up)
list("AvgsForDataExtracted","DataExtracted")

#first - I read labels and features; essentially there are my dictionaries that I will use later on
labels <- read.csv('UCI HAR Dataset/activity_labels.txt', header=F,sep="",col.names=c("No","Activity.Label"))
features <- read.csv('UCI HAR Dataset/features.txt',header=F,sep="",col.names=c("No","Feature.Name"))

#now I load the biggest files - the core data; note that I automatically apply features list as colnames so this is done
test_data <- read.csv('UCI HAR Dataset/test/X_test.txt',header=F,sep="",col.names=features[,"Feature.Name"])
train_data <- read.csv('UCI HAR Dataset/train/X_train.txt',header=F,sep="",col.names=features[,"Feature.Name"])

#I can clean features now as they won't be needed anymore
remove(features)

#now I need labels for the test file - these are corresponding activities
test_labels <- read.csv('UCI HAR Dataset/test/y_test.txt',header=F)
#now I merge these labels with the labels "dictionary" and put it as additional column into test dataset
test_data$Activity.Label <- as.character(merge(labels, test_labels, by.x="No",by.y="V1")[,"Activity.Label"])
#I clean up test_labels - not needed
remove(test_labels)
#and now I add additional column with subjects' numbers -this time directly from file
test_data$Subject <- read.csv('UCI HAR Dataset/test/subject_test.txt',header=F)[,1]

#now I repeat above steps for train dataset 
train_labels <- read.csv('UCI HAR Dataset/train/y_train.txt',header=F)
train_data$Activity.Label <- as.character(merge(labels, train_labels, by.x="No",by.y="V1")[,"Activity.Label"])
remove(train_labels)
train_data$Subject <- read.csv('UCI HAR Dataset/train/subject_train.txt',header=F)[,1]

#and now labels are no longer needed as they are applied so cleanup
remove(labels)

#I merge data into one data.frame and remove subsets from memory
data <- rbind(test_data, train_data)
remove(test_data)
remove(train_data)

#now I need to extract standard deviations column and mean columns which I do with these two lines
#note that there are also meanFreq columns which I think are not requested - that's why I added mean\\. rule
cs <- colnames(data)
cs <- c(cs[grepl('std',cs) | grepl("mean\\.",cs)])

#now the request was to only extract mean and standard deviation which I do
DataExtracted <- data[c(cs,"Subject","Activity.Label")]
#and I understand the whole data is not needed? That's my interpretation
remove(data)

#and now I aaply mean for each unique combination of activity and subject for each column in dataExtracted
#I understand this covers point 5 of the requirement because it is just as tidy as previous data sets
#avg is fairly common (avg is short for averages and s for multiple) so I think this is simple enough
AvgsForDataExtracted <- aggregate(DataExtracted[cs], by=c((DataExtracted["Subject"]),(DataExtracted["Activity.Label"])), mean)

AvgsForDataExtracted

