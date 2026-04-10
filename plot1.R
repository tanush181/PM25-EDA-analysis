# load data
NEI <- readRDS("summarySCC_PM25.rds")

# total emissions per year
total <- aggregate(Emissions ~ year, NEI, sum)

# create plot
png("plot1.png")
plot(total$year, total$Emissions,
     type="b",
     xlab="Year",
     ylab="Total Emissions",
     main="US PM2.5 Emissions (1999-2008)")
dev.off()