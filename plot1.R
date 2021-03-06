#base plot showing total emission for years 1999, 2002, 2005, 2008
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
sub99<- subset(NEI, year == 1999)
sub02 <- subset(NEI, year == 2002)
sub05 <- subset(NEI, year == 2005)
sub08 <- subset(NEI, year == 2008)
barheights <- c(sum(sub99$Emissions), sum(sub02$Emissions), sum(sub05$Emissions), sum(sub08$Emissions))
png(filename= "plot1.png")
barplot(barheights, names.arg = c('1999', '2002', '2005', '2008'), main = "Total Emissions by Year", col = c("red", "orange", "yellow", "green"), ylab = "Emissions (tons)")
dev.off()
