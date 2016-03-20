# Practical Machine Learning - Weight Lifting Exercise Analysis

- ## Description
    Using devices such as Jawbone Up, Nike FuelBand, and Fitbit it is now possible to collect a large amount of data about personal activity relatively inexpensively. These type of devices are part of the quantified self movement. A group of enthusiasts took measurements about themselves regularly to improve their health, to find patterns in their behavior, or because they are tech geeks. One thing that people regularly do is quantify how much of a particular activity they do, but they rarely quantify how well they do it.

    Goal of this project is to use data from accelerometers on the belt, forearm, arm, and dumbell of 6 participants. Participants were asked to perform barbell lifts correctly and incorrectly in 5 different ways. This data was recorded at regular intervals. More information is available from the website here: http://groupware.les.inf.puc-rio.br/har (see the section on the Weight Lifting Exercise Dataset).
    
    
- ## Goal
    Goal of the project is to fit a model with given training data set and predict classe variable of the testing data set.
    
    
- ## Algorithms Testd For better accuracy
    To achieve the goal, I have trained models using diferent algorithms. After repeated trials and tuning process, for our dataset, I found RandomForest to be working best after applying tuning controls.


--------------------------------------------------------------------------------------


- ## Step 1: Cleaning and Processing Data
    Imported pml-training.csv into workspace and assigned those values to train            variable. In further steps, I cleaned data by removing columns with NA's from          dataset. This is done to reduce the number of insignificant columns thereby            improving the processing time and accuracy.
    
    >train = read.csv("C:\\Users\\Administratorsha\\Desktop\\dima\\pml-training.csv",na.strings= c("NA",""," "))
    
    >test = read.csv("C:\\Users\\Administratorsha\\Desktop\\dima\\pml-testing.csv",na.strings= c("NA",""," "))

    >train_NAs <- apply(train, 2, function(x) {sum(is.na(x))})
    >train_new <- train[,which(train_NAs <=10)]
    >train_new <- na.omit(train_new)
    >train_new <- train_new[8:length(train_new)]