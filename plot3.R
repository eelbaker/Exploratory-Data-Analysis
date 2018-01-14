
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
Baltimore <- subset(NEI, fips == "24510")
library(ggplot2)
p <-ggplot(Baltimore, aes(year, Emissions))
png(filename = "plot3.png")
p+geom_point(aes(color = type), alpha = .25)+facet_grid(facets = type~.)+geom_smooth(method = "lm")+coord_cartesian(ylim = c(0,400))+ggtitle("Baltimore Emissions by Type")
dev.off()
