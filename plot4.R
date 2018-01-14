NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
combustion <- grep("[c,C]omb",SCC$SCC.Level.One)
SCC <- SCC[combustion,]
coal <- grep("[C,c]oal", SCC$Short.Name)
CoalSCC <- SCC[coal,]
CoalNEI <- subset(NEI, SCC %in% as.character(CoalSCC$SCC))
library(ggplot2)
png(filename = "plot4.png")
p <-ggplot(CoalNEI, aes(year, Emissions))
p+geom_point(aes(color = type),alpha = .05)+geom_smooth(method = "lm")+coord_cartesian(ylim = c(0,1000))+ggtitle("Coal-Combustion Emissions")+facet_grid(facets = .~type)
dev.off()
