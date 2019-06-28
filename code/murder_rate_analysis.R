state <- read.csv(paste(getwd(), "/statistics/data/raw/state.csv", sep=""))
head(murder_data)

# Measuring Variability
sd(state[["Population"]])     # standard deviation
IQR(state[["Population"]])    # iqr
mad(state[["Population"]])    # mad

# Percentiles and Boxplots
quantile(state[["Murder.Rate"]], p=c(0.05, 0.25, 0.5, 0.75, 0.95))
# 5%    25%   50%   75%   95% 
# 1.600 2.425 4.000 5.550 6.510 
boxplot(state[["Population"]] / 1000000, ylab="Population (millions)")

# Freq Tables
breaks <- seq(from=min(state[["Population"]]),
                to=max(state[["Population"]]),
              length=11)
pop_freq <- cut(state[["Population"]],
                breaks=breaks,
                right=TRUE,
                include.lowest=TRUE)
table(pop_freq)


# Histograms
hist(state[["Population"]], breaks=breaks)

# Density Plot
hist(state[["Murder.Rate"]], freq = FALSE)
lines(density(state[["Murder.Rate"]]), lwd=3, col="blue")
