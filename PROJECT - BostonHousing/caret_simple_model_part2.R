library(tidyverse)
library(caret)
library(mlbench)

data("BostonHousing")

# rename data
df <- BostonHousing

# complete data?
mean(complete.cases(df))

# 1. train test split
split_data <- function(df, train_size=0.8) {
  set.seed(42)
  n <- nrow(df)
  id <- sample(1:n, size=n*train_size)
  train_df <- df[id, ]
  test_df <- df[-id, ]
  list(train = train_df, test = test_df)
}

prep_data <- split_data(df)
train_data <- prep_data[[1]]
test_data <- prep_data[[2]]

# 2. train model
set.seed(42)
model <- train(medv ~ rm + b + crim,
               data = train_data,
               method = "lm")

model

# 3. score/ predict new data (test/ unseen data)
p <- predict(model, newdata=test_data)

# 4. evaluate model => absolute metrics
# mae, mse, rmse
cal_mae <- function(actual, pred) {
  error <- actual - pred
  mean( abs(error) )
}

cal_mse <- function(actual, pred) {
  error <- actual - pred
  mean( error**2 )
}

cal_rmse <- function(actual, pred) {
  error <- actual - pred
  sqrt( mean( error**2 ) )
}

cal_mae(test_data$medv, p)
cal_mse(test_data$medv, p)
cal_rmse(test_data$medv, p)

## save model .RDS
saveRDS(model, "lm_model.RDS")

## read model back into Rstudio
model <- readRDS("lm_model.RDS")





