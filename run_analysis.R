#using ncol(), and View() I determined the measurements of the .txt files of interest:
        # X_test is 561 columns, 2,947 observations
        # y_test is 1 column, 2,947 observations
        # subject_test is 1 column, 2,947 observations

        # X_train is 561 columns, 7,352 observations
        # y_train is 1 column, 7,352 observations
        # subject_train is 1 column, 7,532 observations
         
        #features.txt is 561 labels
        #activity_labels is 6 labels (1-6 numbering)

#set the path to where the downloaded files are kept:
        pathTofiles <- "~/Desktop/Coursera_Courses/Getting_and_Cleaning_Data/UCI Har Dataset"

#Create and reshape the 'test' data frame(df):
        #import X_test as a df, with 561 columns and 2,947 rows:
                df_test <- read.csv((paste(pathTofiles,"/test/X_test.txt",sep = "")), sep = "", header = FALSE )
        #import y_test, subject_test, and features.txt:
                y_test <- read.csv((paste(pathTofiles,"/test/y_test.txt",sep = "")), sep = "\n", header = FALSE )
                subject_test <- read.csv((paste(pathTofiles,"/test/subject_test.txt",sep = "")), sep = "\n", header = FALSE )
                features <- read.csv((paste(pathTofiles,"/features.txt",sep = "")), sep = "\n", header = FALSE )
                #remove leading numbers from rows in features.txt:
                features <- sub("[0-9$]?","",features$V1)
        #add subject_test and y_test as new columns at the beginning of df_test:
                df_test <- cbind(Activity_ID = as.vector(y_test$V1),df_test)
                df_test <- cbind(Subject_ID = as.vector(subject_test$V1),df_test) 
        #set 'features' as the column names, and include the names for the 2 new columns (Subject_ID and Activity_ID):
                features <- append(c("Subject_ID","Activity_ID"), features)
                colnames(df_test) <- features

#Create and reshape the 'train' data frame:
        #import X_train as a df, with 561 columns and 7,352 rows:
                df_train <- read.csv((paste(pathTofiles,"/train/X_train.txt",sep = "")), sep = "", header = FALSE )
        #import y_train and subject_train:
                y_train <- read.csv((paste(pathTofiles,"/train/y_train.txt",sep = "")), sep = "\n", header = FALSE )
                subject_train <- read.csv((paste(pathTofiles,"/train/subject_train.txt",sep = "")), sep = "\n", header = FALSE )
        #add subject_train and y_train as new columns at the beginning of df_train:
                df_train <- cbind(Activity_ID = as.vector(y_train$V1),df_train)
                df_train <- cbind(Subject_ID = as.vector(subject_train$V1),df_train) 
        #set 'features' as the column names:
                colnames(df_train) <- features
#Merge df_test and df_train, such that columns are preserved and rows are added together,
        #df_test(2947 rows) + df_train(7352 rows) = df_merge(10299 rows):
                df_merge <- rbind(df_test,df_train)
        #rearrange df_merge, so that the rows are organized by 'Subject_ID' 
        #and by 'Activity_ID'in ascending order:
                df_merge <- df_merge[with(df_merge, order(df_merge$Subject_ID,df_merge$Activity_ID)),]
        #reindex the rows in the ordered df_merge, remove leading space:
                rownames(df_merge) <- 1:nrow(df_merge)
                names(df_merge) <- sub(" ", "",names(df_merge))
#Obtain the means and standard deviation for each measurement:
        #create vectors that will contain the means, and one that will contain the std devs:
                means_df     <- vector()
                std_devs_df  <- vector()
        #obtain the means and store in them in means_df:
        means_df <- colMeans(df_merge[,3:563])
        #obtain the std devs and store them in std_devs_df: 
        std_devs_df <- sapply(df_merge, sd)
#Change activity identifiers from numbers to descriptive names:                  
        df_merge$Activity_ID <- as.character(df_merge$Activity_ID)
        new_actID <- gsub("1", "Walking", df_merge$Activity_ID)
        new_actID <- gsub("2", "Walking_Upstairs", new_actID)
        new_actID <- gsub("3", "Walking_Downstairs", new_actID)
        new_actID <- gsub("4", "Sitting", new_actID)
        new_actID <- gsub("5", "Standing", new_actID)
        new_actID <- gsub("6", "Laying", new_actID)
        df_merge$Activity_ID <- new_actID 
#Create new, tidy data set which contains the average of each variable for each activity and for each subject:                
        library(stats)
        df_means <- as.data.frame(aggregate(df_merge[3:563], by = list(df_merge$Subject_ID,df_merge$Activity_ID), mean))

                