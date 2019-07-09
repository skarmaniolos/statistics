# measuring correlation between sq foot v tax assessed value for homes in Kings County
# script includes two different plots using ggplot

# using corrplot
library(ggplot2)
library(hexbin)

# load data
kc_tax <- read.csv(paste(getwd(), "/data/kc_tax.csv", sep=""))

# conditional subsetting
kc_tax_subset <- subset(kc_tax, TaxAssessedValue < 750000 & SqFtTotLiving > 100 & SqFtTotLiving < 3500)

# check scale
nrow(kc_tax_subset)
head(kc_tax_subset)

# overall data visualisation
ggplot(kc_tax_subset, (aes(x = SqFtTotLiving, y = TaxAssessedValue / 1000))) +
  stat_binhex(colour = "white") +
  theme_minimal() + 
  scale_fill_gradient(low = "white", high = "purple") +
  labs(x = "Finished Square Feet", y = "Tax Assessed Value (thousands)") +
  guides(fill=guide_legend(title="Frequency"))

# visualising multiple variables by zipcode
ggplot(subset(kc_tax_subset, ZipCode %in% c(98188, 98105, 98108, 98126)),
       aes(x = SqFtTotLiving, y = TaxAssessedValue / 1000)) +
  stat_binhex(colour = "white") +
  theme_minimal() + 
  scale_fill_gradient(low = "white", high = "purple") +
  labs(x = "Finished Square Feet", y = "Tax Assessed Value (thousands)") +
  facet_wrap("ZipCode")
  guides(fill = guide_legend(title="Frequency"))
