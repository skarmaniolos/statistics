# measuring price change correlation between different etfs 


# using corrplot
library(corrplot)
library(RColorBrewer)


# load data
sp500_px <- read.csv(paste(getwd(), "/statistics/data/raw/sp500_data.csv", sep=""))
sp500_sym <- read.csv(paste(getwd(), "/statistics/data/raw/sp500_sectors.csv", sep=""))

etfs <- sp500_px[row.names(sp500_px)>"2012-07-01",
                 sp500_sym[sp500_sym$sector=="etf", 'symbol']]


# set colour values
col <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA"))


# computes p-value of correlations
cor.mtest <- function(mat) {
  mat <- as.matrix(mat)
  n <- ncol(mat)
  p.mat<- matrix(NA, n, n)
  diag(p.mat) <- 0
  for (i in 1:(n - 1)) {
    for (j in (i + 1):n) {
      tmp <- cor.test(mat[, i], mat[, j])
      p.mat[i, j] <- p.mat[j, i] <- tmp$p.value
    }
  }
  colnames(p.mat) <- rownames(p.mat) <- colnames(mat)
  p.mat
}


p.mat <- cor.mtest(etfs)
head(p.mat[,1:5])


# plot results
corrplot(cor(etfs), method = "color", col=col(200),
         type = "upper", order = "hclust",
         addCoef.col = "black",
         tl.col = "black", tl.srt = 45, # text label color/rotation
         p.mat = p.mat, sig.level = 0.01, insig = "blank",
         diag = FALSE
)
