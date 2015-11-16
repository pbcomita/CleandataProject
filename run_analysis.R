###script run_analysis
###
###Get file to current directory
WD <- getwd()
if (!is.null (WD)) setwd(WD)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ", destfile = "projectdata.zip", mode="wb")
##unzip to same directory
unzip("projectdata.zip")
##generates a UCI HAR Dataset folder, reset working directory to this folder
newWD <- paste(WD, "/UCI HAR Dataset", sep = "")
setwd(newWD)
##
## Tidy the raw test data first
##
## read test data
##
datatest <- read.table("test/X_test.txt", stringsAsFactors = FALSE)
##
## read features
##
features <- read.table("features.txt", stringsAsFactors = FALSE)
##
## add names of features to the test data
##
nfeature <- vector()
for (i in 1:561) {
        nfeature[i] <- paste(features[i,2], features[i,1], sep = "id")
        names(datatest)[i] <- nfeature[i]
}
##
## read activity andgive the activity data the column name of activity
yact <- read.table("test/y_test.txt", stringsAsFactors = FALSE) 
names(yact) <- "activity_id"
##
## add column activity variable to the test data, 
dtest1 <- cbind(yact, datatest)
##
## get subject data and assign the subject variable the column name of subjects
ysubj <- read.table("test/subject_test.txt", stringsAsFactors = FALSE)
names(ysubj) <- "subject_id"
## add column subject variable to the test data
dtest2 <- cbind(ysubj, dtest1)
##
## Tidy the training data second
##
## read training data
##
datatrain <- read.table("train/X_train.txt", stringsAsFactors = FALSE)
##
## add names of features to the test data, taking into account the duplicate names by adding the number to the name
for (i in 1:561) {
        nfeature[i] <- paste(features[i,2], features[i,1], sep = "id")
        names(datatrain)[i] <- nfeature[i]
}
## read activity and give the activity data the column name of activity_id
ytract <- read.table("train/y_train.txt", stringsAsFactors = FALSE)
names(ytract) <- "activity_id"
##
## add column activity variable to the test data, 
dtrain1 <- cbind(ytract, datatrain)
## get subject data and assign the subject variable name "subject_id" to the column name of subject ids
ytrsubj <- read.table("train/subject_train.txt", stringsAsFactors = FALSE)
names(ytrsubj) <- "subject_id"
##
## add column subject variable to the test data
dtrain2 <- cbind(ytrsubj, dtrain1)
##
## combine into one dataframe, including the subject and activity variable
alldata <- rbind(dtest2, dtrain2)
##
## select the data that contains mean() and std() for the dataset
##
avgstd <- select(alldata, contains("_id"), contains("mean()"), contains("std()"))
##
## replace activity ID number with descriptive variable name, first changing the variable to a character variable
##
avgstd$activity_id <- as.character(avgstd$activity_id)
for (i in 1:10299){
        if (avgstd[i, 2] == "1") {avgstd[i, 2] <- "Walking"}
        else if (avgstd[i, 2] == "2") {avgstd[i,2] <- "Walking_upstairs"}
        else if (avgstd[i, 2] == "3") {avgstd[i,2] <- "Walking_downstairs"}
        else if (avgstd[i, 2] == "4") {avgstd[i,2] <- "Sitting"}
        else if (avgstd[i, 2] == "5") {avgstd[i,2] <- "Standing"}
        else if (avgstd[i, 2] == "6") {avgstd[i,2] <- "Laying"}
}
##
## clean up names and make them simpler to read
ntemp <- vector()
for (i in 3:68){
        ntemp[i]<- gsub("-","", names(avgstd)[i]) ##remove all dashes
        ntemp[i]<- gsub("\\()","", ntemp[i])      ##removes parentheses
        ntemp[i]<- gsub("X", "DimensionX", ntemp[i]) ## replace X with Dimension X
        ntemp[i]<- gsub("Y", "DimensionY", ntemp[i]) ## replace Y with Dimension Y
        ntemp[i]<- gsub("Z", "DimensionZ", ntemp[i]) ## replace Z with Dimension Z
        names(avgstd)[i] <- ntemp[i]
}
## the dataframe avgstd now contains the original data in tidy form.
##
##resummarize data by groups, but do it with the average of the data type for each 
##activity, by subject. The data will be in the tidyit dataframe which has 180 
##observations of the 68 different data. The data are the averages of the mean and std dev data.
##
tidyit <- data.frame()
tidyit <- ddply(avgstd, c("activity_id", "subject_id"), summarise, 
               avg1tBodyAccmeanDimensionXid1 = mean(tBodyAccmeanDimensionXid1),
               avg2tBodyAccmeanDimensionYid2 = mean(tBodyAccmeanDimensionYid2),
               avg3tBodyAccmeanDimensionZid3 = mean(tBodyAccmeanDimensionZid3),
               avg4tGravityAccmeanDimensionXid41 = mean(tGravityAccmeanDimensionXid41),
               avg5tGravityAccmeanDimensionYid42 = mean(tGravityAccmeanDimensionYid42),
               avg6tGravityAccmeanDimensionZid43 = mean(tGravityAccmeanDimensionZid43),
               avg7tBodyAccJerkmeanDimensionXid81 = mean(tBodyAccJerkmeanDimensionXid81),
               avg8tBodyAccJerkmeanDimensionYid82 = mean(tBodyAccJerkmeanDimensionYid82),
               avg9tBodyAccJerkmeanDimensionZid83 = mean(tBodyAccJerkmeanDimensionZid83),
               avg10tBodyGyromeanDimensionXid121 = mean(tBodyGyromeanDimensionXid121),
               avg11tBodyGyromeanDimensionYid122 = mean(tBodyGyromeanDimensionYid122),
               avg12tBodyGyromeanDimensionZid123 = mean(tBodyGyromeanDimensionZid123),
               avg13tBodyGyroJerkmeanDimensionXid161 = mean(tBodyGyroJerkmeanDimensionXid161),
               avg14tBodyGyroJerkmeanDimensionYid162 = mean(tBodyGyroJerkmeanDimensionYid162),
               avg15tBodyGyroJerkmeanDimensionZid163 = mean(tBodyGyroJerkmeanDimensionZid163),
               avg16tBodyAccMagmeanid201 = mean(tBodyAccMagmeanid201),
               avg17tGravityAccMagmeanid214 = mean(tGravityAccMagmeanid214),
               avg18tBodyAccJerkMagmeanid227 = mean(tBodyAccJerkMagmeanid227),
               avg19tBodyGyroMagmeanid240 = mean(tBodyGyroMagmeanid240),
               avg20tBodyGyroJerkMagmeanid253 = mean(tBodyGyroJerkMagmeanid253),
               avg21fBodyAccmeanDimensionXid266 = mean(fBodyAccmeanDimensionXid266),
               avg22fBodyAccmeanDimensionYid267 = mean(fBodyAccmeanDimensionYid267),
               avg23fBodyAccmeanDimensionZid268 = mean(fBodyAccmeanDimensionZid268),
               avg24fBodyAccJerkmeanDimensionXid345 = mean(fBodyAccJerkmeanDimensionXid345),
               avg25fBodyAccJerkmeanDimensionYid346 = mean(fBodyAccJerkmeanDimensionYid346),
               avg26fBodyAccJerkmeanDimensionZid347 = mean(fBodyAccJerkmeanDimensionZid347),
               avg27fBodyGyromeanDimensionXid424 = mean(fBodyGyromeanDimensionXid424),
               avg28fBodyGyromeanDimensionYid425 = mean(fBodyGyromeanDimensionYid425),
               avg29fBodyGyromeanDimensionZid426 = mean(fBodyGyromeanDimensionZid426),
               avg30fBodyAccMagmeanid503 = mean(fBodyAccMagmeanid503),
               avg31fBodyBodyAccJerkMagmeanid516 = mean(fBodyBodyAccJerkMagmeanid516),
               avg32fBodyBodyGyroMagmeanid529 = mean(fBodyBodyGyroMagmeanid529),
               avg33fBodyBodyGyroJerkMagmeanid542 = mean(fBodyBodyGyroJerkMagmeanid542),
               avg34tBodyAccstdDimensionXid4 = mean(tBodyAccstdDimensionXid4),
               avg35tBodyAccstdDimensionYid5 = mean(tBodyAccstdDimensionYid5),
               avg36tBodyAccstdDimensionZid6 = mean(tBodyAccstdDimensionZid6),
               avg37tGravityAccstdDimensionXid44 = mean(tGravityAccstdDimensionXid44),
               avg38tGravityAccstdDimensionYid45 = mean(tGravityAccstdDimensionYid45),
               avg39tGravityAccstdDimensionZid46 = mean(tGravityAccstdDimensionZid46),
               avg40tBodyAccJerkstdDimensionXid84 = mean(tBodyAccJerkstdDimensionXid84),
               avg41tBodyAccJerkstdDimensionYid85 = mean(tBodyAccJerkstdDimensionYid85),
               avg42tBodyAccJerkstdDimensionZid86 = mean(tBodyAccJerkstdDimensionZid86),
               avg43tBodyGyrostdDimensionXid124 = mean(tBodyGyrostdDimensionXid124),
               avg44tBodyGyrostdDimensionYid125 = mean(tBodyGyrostdDimensionYid125),
               avg45tBodyGyrostdDimensionZid126 = mean(tBodyGyrostdDimensionZid126),
               avg46tBodyGyroJerkstdDimensionXid164 = mean(tBodyGyroJerkstdDimensionXid164),
               avg47tBodyGyroJerkstdDimensionYid165 = mean(tBodyGyroJerkstdDimensionYid165),
               avg48tBodyGyroJerkstdDimensionZid166 = mean(tBodyGyroJerkstdDimensionZid166),
               avg49tBodyAccMagstdid202 = mean(tBodyAccMagstdid202),
               avg50tGravityAccMagstdid215 = mean(tGravityAccMagstdid215),
               avg51tBodyAccJerkMagstdid228 = mean(tBodyAccJerkMagstdid228),
               avg52tBodyGyroMagstdid241 = mean(tBodyGyroMagstdid241),
               avg53tBodyGyroJerkMagstdid254 = mean(tBodyGyroJerkMagstdid254),
               avg54fBodyAccstdDimensionXid269 = mean(fBodyAccstdDimensionXid269),
               avg55fBodyAccstdDimensionYid270 = mean(fBodyAccstdDimensionYid270),
               avg56fBodyAccstdDimensionZid271 = mean(fBodyAccstdDimensionZid271),
               avg57fBodyAccJerkstdDimensionXid348 = mean(fBodyAccJerkstdDimensionXid348),
               avg58fBodyAccJerkstdDimensionYid349 = mean(fBodyAccJerkstdDimensionYid349),
               avg59fBodyAccJerkstdDimensionZid350 = mean(fBodyAccJerkstdDimensionZid350),
               avg60fBodyGyrostdDimensionXid427 = mean(fBodyGyrostdDimensionXid427),
               avg61fBodyGyrostdDimensionYid428 = mean(fBodyGyrostdDimensionYid428),
               avg62fBodyGyrostdDimensionZid429 = mean(fBodyGyrostdDimensionZid429),
               avg63fBodyAccMagstdid504 = mean(fBodyAccMagstdid504),
               avg64fBodyBodyAccJerkMagstdid517 = mean(fBodyBodyAccJerkMagstdid517),
               avg65fBodyBodyGyroMagstdid530 = mean(fBodyBodyGyroMagstdid530),
               avg66fBodyBodyGyroJerkMagstdid543 = mean(fBodyBodyGyroJerkMagstdid543))

##write the tidyit dataframe to a text file to the working directory for uploading to the project deliverable
write.table(tidyit, file = "tidydata.txt", row.name=FALSE)
