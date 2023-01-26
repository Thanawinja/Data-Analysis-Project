# Import csv file
itu <- read.csv(file.choose() , header = T)
names(itu)
head(itu)
dim(itu)
mean(complete.cases(itu))
str(itu)
summary(itu)

# Check class
class(itu$ITU)

# Change class from integer to factor
itu$ITU <- as.factor(itu$ITU)
itu$Gender <- as.factor(itu$Gender)
itu$Education <- as.factor(itu$Education)
itu$Income <- as.factor(itu$Income)

str(itu)

# Remove ID column
itu$ID <- NULL

# Histrogram
hist(itu$PEOU, col = "green")
hist(itu$PU, col = "yellow")

# Data Partition
set.seed(123)
s <- sample(358,280) # 80% of 358 = 280
s

itu_train <- itu[s,] # Training Dataset
itu_train

itu_test <- itu[-s,] # Testing Dataset
itu_test

nrow(itu_train)
nrow(itu_test)


# Train a Decision Tree 
install.packages("rpart") 
library(rpart)
dtm <- rpart(ITU~., itu_train, method = "class")
dtm

# Export Training Dataset
df <- data.frame(itu_train)
df
write.csv(df, "itu_train.csv")


install.packages("rpart.plot")
library(rpart.plot)
rpart.plot(dtm)
rpart.plot(dtm, type = 5 , extra = 8)

# Misclassification Table (MT)
p <- predict(dtm, itu_test, type = "class")
p

MT <- table(Actualvalue = itu_test$ITU, p)
MT

accuracy <- sum(diag(MT)/sum(MT))
accuracy

Misclassification <- 1-sum(diag(MT)/sum(MT))
Misclassification

# Export Prediction
dfp <- data.frame(p, itu_test$ITU, itu_test$PEOU, itu_test$PU)
dfp
write.csv(dfp, "Prediction.csv")