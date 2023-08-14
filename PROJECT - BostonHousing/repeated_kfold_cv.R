
## tuneLength vs. tuneGrid (set K manually)
set.seed(42)
ctrl <- trainControl(
  method = "repeatedcv", 
  number = 5, # k=5
  repeats = 5, # repeates=5
  verboseIter = TRUE
)

## tune grid
model <- train(medv ~ rm + b + crim + lstat + age,
               data = train_data,
               method = "knn",
               metric = "Rsquared",
               tuneGrid = data.frame(k=c(5,7,13)),
               preProcess = c("center", "scale"),
               trControl = ctrl)

## ML == Experimentation