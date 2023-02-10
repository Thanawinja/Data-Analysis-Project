# Load Library
install.packages("tidyverse")
library(tidyverse)

# Read data
url <- "https://raw.githubusercontent.com/mwaskom/seaborn-data/master/penguins.csv"
penguins <- read_csv(url)   # Penguins

# Verbs for manipulating dataframe
head(penguins)
tail(penguins)
glimpse(penguins)

# Clean data
my_data <- drop_na(penguins)

# Subset data 
my_data <- my_data[, -2] # delete island column

# Correlation
correlation <- cor(my_data$bill_length_mm, my_data$bill_depth_mm)
correlation


#Visualization
ggplot(data = my_data) +
  geom_histogram(mapping = aes(bill_length_mm)) +
  facet_wrap(~sex) +
  labs(title = "Bill Length Histogram") +
  theme_minimal()

ggplot(data = my_data) +
  geom_histogram(mapping = aes(bill_depth_mm)) +
  facet_wrap(~sex) +
  labs(title = "Bill Depth Histogram") +
  theme_minimal()

ggplot(data = my_data) +
  geom_bar(mapping = aes(y = species)) +
  labs(title = "Penguins Species Bar Chart") +
  theme_minimal() 

ggplot(data = my_data) +
  geom_point(mapping = aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
  facet_wrap(~sex) +
  labs(title = "Scatter plot of Bill Length vs Bill Depth",
       x = "Bill Length (mm)",
       y = "Bill Depth (mm)") +
  theme_minimal()


## Linear Regression Model
# y = f(x) : body_mass_g = f(bill_length_mm)
model <- lm(body_mass_g ~ bill_length_mm, data = my_data)
summary(model)

new_penguin <- data.frame(bill_length_mm = 40)
predict(model, new_penguin)

# Save Model
saveRDS(model, "penguin_predictmass_model.rds")



## Decision Tree Model
# Split data
set.seed(42)
n <- nrow(my_data)
s <- sample(1:n, 0.8*n) 
train_data <- my_data[s,] # 80%
test_data <- my_data[-s,] # 20%

# Load Library for these model
install.packages("rpart")
library(rpart)
install.packages("rpart.plot")
library(rpart.plot)

# Train Model 
dtm <- rpart(species ~. , data = train_data, method = "class")
dtm
rpart.plot(dtm, type = 5, extra = 8)

# Prediction
p <- predict(dtm, test_data, type = "class")
accuracy <- mean(p == test_data$species) 
accuracy

# Confusion Matrix
table(p, test_data$species, dnn = c("predicted" , "actual"))

