
## train control
## change resampling technique

## golden rule: K-Fold CV
set.seed(25)
ctrl <- trainControl(
  method = "cv",
  number = 5,
  verboseIter = TRUE
)

## add preProcess
## hyperparamter tuning in train process
model <- train(medv ~ rm + b + crim + lstat + age,
               data = train_data,
               method = "knn",
               preProcess = c("range", "zv", "nzv"),
               tuneLength = 4,
               trControl = ctrl)

## train final model using k=5
model_k5 <- train(medv ~ rm + b + crim + lstat + age,
      data = train_data,
      method = "knn",
      tuneGrid = data.frame(k=11),
      preProcess = c("range", "zv", "nzv"),
      trControl = trainControl(method="none"))

## predict test set
p_train <- predict(model_k5)
p_test <- predict(model_k5, newdata=test_data)

## rmse for test set
rmse_train <- cal_rmse(train_data$medv, p_train)
rmse_test <- cal_rmse(test_data$medv, p_test)
rmse_train; rmse_test




