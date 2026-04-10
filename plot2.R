# load data
NEI <- readRDS("summarySCC_PM25.rds")

# subset for Baltimore
baltimore <- subset(NEI, fips == "24510")

# total emissions per year
total <- aggregate(Emissions ~ year, baltimore, sum)

# plot
png("plot2.png")
plot(total$year, total$Emissions,
     type="b",
     xlab="Year",
     ylab="Emissions",
     main="Baltimore PM2.5 Emissions (1999-2008)")
dev.off()