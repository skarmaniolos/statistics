# SETUP/LOAD
data <- read.csv("round1.csv", header=TRUE)
par(mfrow=c(1,2)) # update as required

#############################################################################################
# DATA PROCESSING/CLEANING
#############################################################################################

# change column name
colnames(data)[colnames(data) == "for."] <- "scored"

# get short names for labelling
short_name <- data.frame(c(1:10),
                         c('Azzurri', 'Cooks Hill', 'Westlakes', 'Fletcher', 'Suburbs','Wallsend','New Lambton','Uni','Jesmond','Stockton'))
names(short_name) <-c("position","short_name")

data <- merge(data, short_name)

#############################################################################################
# GOALS F/A PLOT
#############################################################################################

# plotting goals scored/against
plot(data$scored, data$against, 
     main="Goals Scored/Against",
     xlab="Goals Scored",
     ylab="Goals Against",
     pch=19)

# regression line
abline(lm(data$scored~data$against), col="red")

# label certain teams separately to remove overlapping
label_teams_1 <- c('Azzurri','Cooks Hill','Stockton','Jesmond')
data_subset_1 <- subset(data, data$short_name %in% label_teams_1)
label_teams_2 <- c('Uni','Suburbs', 'Wallsend', 'Westlakes', 'Fletcher')
data_subset_2 <- subset(data, data$short_name %in% label_teams_2 )
label_teams_3 <- c('New Lambton')
data_subset_3 <- subset(data, data$short_name %in% label_teams_3)

# text labels
text(data_subset_1$scored, data_subset_1$against, labels=data_subset_1$short_name,pos=2,cex=0.8)
text(data_subset_2$scored, data_subset_2$against, labels=data_subset_2$short_name,pos=4,cex=0.8)
text(data_subset_3$scored, data_subset_3$against, labels=data_subset_3$short_name,adj=1,pos=1,offset=0.8,cex=0.8)#, adj = c(1,1))


#############################################################################################
# POINTS PER GAME
#############################################################################################

ppg_plot <- barplot((data$points/data$played),  # points / games played
                        main="Points Per Game",
                        xlab="",las=2, 
                        ylab="",
                        col=topo.colors(40),
                        space=0.1,
                        names.arg= data$short_name,
                        cex.names = 0.7
                        )
                abline(h=mean(data$points/data$against),
                       col="red",
                       lty = 5,
                       lwd = 2)



