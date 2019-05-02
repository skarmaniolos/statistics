# measuring correlation between sq foot v tax assessed value for homes in Kings County.

# using corrplot
library(ggplot2)
library(hexbin)

# load data
kc_tax <- read.csv(paste(getwd(), "/statistics/data/raw/kc_tax.csv", sep=""))

# conditional subsetting
kc_tax_subset <- subset(kc_tax, TaxAssessedValue < 750000 & SqFtTotLiving > 100 & SqFtTotLiving < 3500)

# check scale
nrow(kc_tax_subset)
head(kc_tax_subset)

# plot data
ggplot(kc_tax_subset, (aes(x = SqFtTotLiving, y = TaxAssessedValue / 1000))) +
  stat_binhex(colour = "white") +
  theme_minimal() + 
  scale_fill_gradient(low = "white", high = "purple") +
  labs(x = "Finished Square Feet", y = "Tax Assessed Value (thousands)") +
  guides(fill=guide_legend(title="Frequency"))
