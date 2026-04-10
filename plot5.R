# load data
NEI <- readRDS("summarySCC_PM25.rds")

# filter Baltimore + motor vehicles
data <- subset(NEI, fips == "24510" & type == "ON-ROAD")

# total emissions per year
total <- aggregate(Emissions ~ year, data, sum)

# plot
png("plot5.png")
plot(total$year, total$Emissions,
     type="b",
     xlab="Year",
     ylab="Emissions",
     main="Motor Vehicle Emissions in Baltimore (1999-2008)")
dev.off()