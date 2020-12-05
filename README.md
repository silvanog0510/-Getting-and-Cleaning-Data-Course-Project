# -Getting-and-Cleaning-Data-Course-Project
This is the final course project for the Coursera "Getting and Cleaning Data" Course


# run_analysis.R Description: 
The script 'run_analysis.R' uses the activity tracker data downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip (downloaded to the working directory as a zip file that unzips to a folder named 'UCI Har Dataset').

The script creates a tidy dataset as a data frame containing all measurements, and another tidy dataset containing means for specific groups. 

First, the script reads in 'X' , 'y' , and 'subject' for the test dataset. The file 'features' is also read in, and used as the column names for the 561 measurements contained in the 'X' file. The 'y' file is read in and set to be the 'Activity_ID' identifier. The 'subject' file is read in and set as the 'Subject_ID' identifier. This creates df_test with 2,947 observations. 

Next, code for df_train is performed which creates a similar data frame for the training data which has 7,532 observations.  

Next, df_test and df_train are merged.Then the means and standard deviations for each of the 561 measurement are calculated and stored in vectors.

Next, the 'Activity_ID' numbers are changed to more descriptive titles (which are contained in the 'activity_labels.txt' file).

Lastly, a second tidy data set is created that is a data frame containing the means for each of the 561 measurements, grouped by 'Subject_ID' and by 'Activity_ID'.

