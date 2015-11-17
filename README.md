==================================================================
README for script run_analysis.R 
==================================================================
This README.md file describes the script run_analysis.R used to process the raw data contained in the data set as described below. The purpose of the script run_analysis.R is to demonstrate ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. See the CodeBook.md for the description of variables and details of data sets. 

The one R script called run_analysis.R that does the following. 
1. Downloads the raw data datafiles from     https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
   and unzips the files into the UCI HAR Dataset folder in the current directory, and then sets the working directory to the UCI HAR Dataset folder. All work is done in that directory. 
2. Merges the training and the test sets to create one data set.
3. Extracts only the measurements on the mean and standard deviation for each measurement. 
4. Uses descriptive activity names to name the activities in the data set
5. Appropriately labels the data set with descriptive variable names. 
6. From the data set (avgstd) in step 4, a second, independent tidy data set (tidyit) with the average of each variable for each activity and each subject. This dataset is of the "wide form" variety, similar to the starting set, but now the data is the average of the datatype from the values contained in the raw data. 

CodeBook
========
The file CodeBook.md, also submitted, describes the variables used from the raw data files, as well as the output dataframe. This README.md file provides information on how the script works. The detailed flow here describes how the raw data is processed. 

Detailed run_analysis script flow description
=============================================
1. Downloads the file from the source to the current directory.
2. Unzips to same directory, which generates the "UCI HAR Dataset" folder.
3. Add the features.txt as a column names to the  X_test data. First combine the number id in the features.txt file with the feature name due to the duplicate feature names. This ensures uniqueness of each type of test data as described in the code book. 
4. Add "activity_id" as column name to y_test.txt data frame using names
5. cbind activity_id to the X_test data
6. Add "subject_id" as column name to the subject_test.txt dataframe using names
7. cbind subject_id to the X_test data
8. The dataframe dtest2 is a cleaned up data set for test data. 
10. Repeat the steps 3-7 for the training data as follows in steps 11-15. 
11. Add the features.txt as column names to the X_train data. First combine the number id in the features.txt file with the feature name due to the duplicate feature names
12. Add "activity_id" as column name to y_train.txt data frame using names
13. cbind activity_id to the X_train data
14. Add "subject_id" as column name to the subject_train.txt dataframe using names
15. cbind subject_id to the X_train data
15.5 The dataframe dtrain2 is a cleaned up data set for the training data.
16. Merge the train(dtrain2) and test(dtest2) dataframes, so there is one complete set, using the rowbind function.
17. Select only the data that is a measurement of mean or std deviation (see CodeBook.md for this selection and description. Also include the id columns for the subject and activity variables to ensure uniqueness of each data.
18. Replace the number activity id with the descriptive variable name.
19. Make each of the measurements in the data set a more readable name by getting rid of extraneous characters and relabeling "X", "Y", or "Z" with "Dimension XYZ" as appropriate. I have left the data descriptor for the most part intact, as it contains key information that is translated in the CodeBook.md. Also the id was kept so as to ensure uniqueness of each of the data descriptors.
20. The dataframe avgstd now contains the original data in tidy form.
21. Resummarize data by groups, but do it with the average of the data type for each activity, by subject. The data will be in the tidyit dataframe which has 180 observations of the 68 different data. The data are the averages of the mean and std dev data. This dataset is of the "wide form" variety, similar to the starting set, but now the data is the average of the datatype from the values contained in the raw data.
22. Write the data from tidyit dataframe to a text output file named "tidydata.txt"