library(ggplot2)
library(descr)

# load in from csv
lung <- read.csv(paste(getwd(), "/r-statistics/data/raw/LungDisease.csv", sep=""))

# linear regression model
lr_model <- lm(Exposure ~ PEFR, data=lung)

# residuals / fitted values
fitted <- predict(lr_model)
resid <- residuals(lr_model)

# plotting the model
plot(lung)
abline(lr_model)
