# Getting the data. Don't run this if you already have it

if(!file.exists("./peer_grading"))
        {dir.create("./peer_grading")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./peer_grading/data.zip",method="curl")
unzip(zipfile="./peer_grading/Data.zip")

#Load the files. For both training and test sets, we use : 
# A subject file containing subject numbers. It is for these people ( 30 of them) that data is recorded
# A features files which contains the column descriptions
# A label file (y_...) indicating what activity the record is about
# The actual recorded data
# The label file has to be linked with the overall activity_label file to find out what activities
# the numbers in the label files refer to

library(data.table)

activity_labels<-fread("./UCI HAR dataset/activity_labels.txt")
subject_test<-fread("./UCI HAR dataset/test/subject_test.txt")
subject_train<-fread("./UCI HAR dataset/train/subject_train.txt")
data_test<-fread("./UCI HAR dataset/test/X_test.txt")
data_train<-fread("./UCI HAR dataset/train/X_train.txt")
activity_test<-fread("./UCI HAR dataset/test/y_test.txt")
activity_train<-fread("./UCI HAR dataset/train/y_train.txt")
features<-fread("./UCI HAR dataset/features.txt")

#we now merge test and train data together for subject, activity and data

subject<-rbind(subject_test,subject_train)
activity<-rbind(activity_test,activity_train)
data<-rbind(data_test,data_train)

 #let's get columns on each of the files

subjectname<-c("subject")
activityname<-c("activity")
datanames<-features$V2
names(subject)<-subjectname
names(activity)<-activityname
names(data)<-datanames

#Now we link the columns of the data, activity and subject files and we add the labels for the activities 
#in the field "activity description"

colnames(activity_labels)<-c("activity","activitydescription")
activity<-merge(activity,activity_labels,by="activity")
alldata<-cbind(data,subject,activity)

#Extracting only the measures on mean and standard deviation--> all column descriptions containing "mean" or "std"

library(dplyr)

selectdataname<-as.vector(grep("mean|std",datanames))
selectdata<-subset(alldata,select=selectdataname)

#creating a separate data set containing the average  per activity and subject - 
#       after deduplication ( dplyr does not like duplicates)

selectdatda_dedup<-subset(selectdatda, select=which(!duplicated(names(selectdata))))

average_data<-  selectdata_dedup %>%
                group_by(activitydescription,subject) %>%
                summarise_all(funs(mean))

write.csv(average_data,file="average_data.csv")








