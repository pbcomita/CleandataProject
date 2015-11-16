==================================================================
Script run_analysis.R 
submitted for Getting and Cleaning Data Class
==================================================================
This CodeBook.md file describes the variables that were used to process the raw data contained in the data set described below, and the output variables in the output text file. The purpose of the script run_analysis.R is to demonstrate ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

Overview of script
==================
The one R script called run_analysis.R that does the following. 
1. Downloads the raw data datafiles from     https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
   and unzips the files into the UCI HAR Dataset folder in the current directory, and then sets the working directory to the UCI HAR Dataset folder. All work is done in that directory. 
2. Merges the training and the test sets to create one data set.
3. Extracts only the measurements on the mean and standard deviation for each measurement. 
4. Uses descriptive activity names to name the activities in the data set
5. Appropriately labels the data set with descriptive variable names. 
6. From the data set (avgstd) in step 4, a second, independent tidy data set (tidyit) with the average of each variable for each activity and each subject. This dataset is of the "wide form" variety, similar to the starting set, but now the data is the average of the datatype from the values contained in the raw data.
7. The file "tidydata.txt" from the tidyit dataframe is written to the current working directory.

Overview of tidyit dataframe
============================ 
The structure of the dataframe tidyit is as follows:
====================================================
'data.frame':	180 obs. of  68 variables:
 $ activity_id                          : chr  "Laying" "Laying" "Laying" "Laying" ...
 $ subject_id                           : int  1 2 3 4 5 6 7 8 9 10 ...
 $ avg1tBodyAccmeanDimensionXid1        : num  0.222 0.281 0.276 0.264 0.278 ...
 $ avg2tBodyAccmeanDimensionYid2        : num  -0.0405 -0.0182 -0.019 -0.015 -0.0183 ...
 ....
 
 Description of the variables in the tidyit dataframe
 ====================================================
 The first column is the activity_id, which is the activity name from the raw dataset. 
 The second column is the subject_id, which is the number identifier of the subject.
 The 3 to 68 columns are the averaged data, as identified in the following data table:
 
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
               avg66fBodyBodyGyroJerkMagstdid543 = mean(fBodyBodyGyroJerkMagstdid543)
               
=================================================================
The features of the dataset were from the original data set and are described here. Only the variables that estimated the mean value (mean) and the standard deviation (std) are used. These are abbreviated in the column names for simplicity. 
               
Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
 
Not used features included in the original data set 
===================================================
 The additional vectors obtained by averaging the signals in a signal window sample were not used in this tidy set. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'



Raw data from the following dataset:
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
