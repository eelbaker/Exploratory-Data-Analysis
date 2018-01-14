#plot showing total emissions from 1999 to 2008 in Baltimore
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
Baltimore <- subset(NEI, fips == "24510")
BaltimoreSplit <- split(Baltimore, Baltimore$year)
barheights <- sapply(BaltimoreSplit, FUN <- function(x){sum(x$Emissions)})
png(filename = 'plot2.png')
barplot(barheights, main = "Total Emissions by Year: Baltimore", col = c("red", "orange", "yellow", "green"), ylab = "Emissions (tons)")
dev.off()

