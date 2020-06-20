setwd("./desktop/Coursera R programming/Getting and Cleaning Data/week4")
library(dplyr)
#loading data into R
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
features<-read.table("UCI HAR Dataset/features.txt",col.names = c("n","functions"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

#manipulating datasets
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
Merged <- cbind(Subject, Y, X)
names(Merged)

#cleaning data
Tidy <- Merged %>% select(subject, code, contains("mean"), contains("std"))
Tidy$code <- activities[Tidy$code, 2]
names(Tidy)[2]
names(Tidy)[2]="activity"

names(Tidy)<-gsub("angle", "Angle", names(Tidy),ignore.case = TRUE)
names(Tidy)<-gsub("Acc", "Accelerometer", names(Tidy),ignore.case = TRUE)
names(Tidy)<-gsub("Gyro", "Gyroscope", names(Tidy),ignore.case = TRUE)
names(Tidy)<-gsub("BodyBody", "Body", names(Tidy),ignore.case = TRUE)
names(Tidy)<-gsub("Mag", "Magnitude", names(Tidy),ignore.case = TRUE)
names(Tidy)<-gsub("^t", "Time", names(Tidy))
names(Tidy)<-gsub("^f", "Frequency", names(Tidy))
names(Tidy)<-gsub("tBody", "TimeBody", names(Tidy),ignore.case = TRUE)
names(Tidy)<-gsub("-mean()", "Mean", names(Tidy), ignore.case = TRUE)
names(Tidy)<-gsub("-std()", "STD", names(Tidy), ignore.case = TRUE)
names(Tidy)<-gsub("-freq()", "Frequency", names(Tidy), ignore.case = TRUE)
names(Tidy)<-gsub("gravity", "Gravity", names(Tidy),ignore.case = TRUE)

Final <- Tidy %>%
  +     group_by(subject, activity) %>%
  +     summarise_all(funs(mean))

write.table(Final, "Final.txt", row.name=FALSE)
str(Final)
summary(Final)

