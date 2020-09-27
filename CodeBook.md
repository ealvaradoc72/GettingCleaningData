# CodeBook

Enrique Alvarado 

The present CodeBook describes the data, variables and tranformations used to get a tidy dataset from a RAW two sources from a data collected by accelerometers used by persons.

The raw data can be found in [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). Please check the website for detailed description.


**Data Set Information:**

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.  
  
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The raw data was obtained via download from the source script, and unzip to data folder

**Variables :**
|Variable   |Description   |
|---|---|
|Url|URL Address to the source data   |
|test_path |Path to test data   |
|train_path|Path to train data   |
|info_path |Path to data folder with data|
|features |Data Frame to store features data   |
|act_labels |Data Frame to store activity labels|
|subject_train|Data frame to store subject training data|
|X_train|Data frame to store training set|
|Y_train|Data frame to store training set|
|subject_test|Data frame to store subject test data|
|X_test|Data frame to store test set|
|Y_test|Data frame to store test set|
|train|Data frane to temporary hold all train set|
|test|Data frane to temporary hold all test set|
|merged|Merged both sets| 
|names|Vector to store the names of merged data|
|columns|Logica Vector to store mask label data|
|group_result| Grouped result by subject and activity|
|mergedDataResult|Data set result with calculate of mean|
