# -Getting-and-Cleaning-Data-Course-Project
This is the final course project for the Coursera "Getting and Cleaning Data" Course


# run_analysis.R Description: 
The script 'run_analysis.R' uses the activity tracker data downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip (downloaded to the working directory as a zip file that unzips to a folder named 'UCI Har Dataset').

The script creates a tidy dataset as a data frame containing all 'mean' and 'std' (standard deviation) measurements, and another tidy dataset containing means of these values for specific groups. 

First, the script reads in 'X' , 'y' , and 'subject' for the test dataset. The file 'features' is also read in, and used as the column names for the 561 measurements contained in the 'X' file. The 'y' file is read in and set to be the 'Activity_ID' identifier. The 'subject' file is read in and set as the 'Subject_ID' identifier. This creates df_test with 2,947 observations. 

Next, code for df_train is performed which creates a similar data frame for the training data which has 7,532 observations.  

Next, df_test and df_train are merged.

Next, the variable columns containing the terms 'mean' and 'std' (standard deviation) are kept while the rest of the columns are removed. 

Next, the 'Activity_ID' numbers are changed to more descriptive titles (which are contained in the 'activity_labels.txt' file).

Next, the variable/columns names are changed to be more descriptive. 

Lastly, a second tidy data set ('df_means') is created that is a data frame containing the means for each of the 66 'mean' and 'std' measurements, grouped by 'Subject_ID' and by 'Activity_ID' for a total of 180 rows, 68 columns. There is one row for every unique combination of 'Subject_ID' and 'Activity_ID'. 

