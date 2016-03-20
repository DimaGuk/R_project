library(caret)
library(randomForest)

train = read.csv("C:\\Users\\Administratorsha\\Desktop\\dima\\pml-training.csv", na.strings= c("NA",""," "))
test = read.csv("C:\\Users\\Administratorsha\\Desktop\\dima\\pml-testing.csv", na.strings= c("NA",""," "))

train_NAs <- apply(train, 2, function(x) {sum(is.na(x))})
train_new <- train[,which(train_NAs <=10)]
train_new <- na.omit(train_new)
train_new <- train_new[8:length(train_new)]



inTrain <- createDataPartition(y = train_new$classe, p = 0.7, list = FALSE)
training <- train_new[inTrain, ]
crossVal <- train_new[-inTrain, ]


rf_model = randomForest(classe~.,data = training)
rf_model



predCrossVal <- predict(rf_model, crossVal)

table(crossVal$classe, predCrossVal)

predictTest <- predict(rf_model, test)
predictTest





















