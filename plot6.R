library(ggplot2)

# load data
NEI <- readRDS("summarySCC_PM25.rds")

# filter Baltimore & LA motor vehicles
data <- subset(NEI, fips %in% c("24510", "06037") & type == "ON-ROAD")

# aggregate
total <- aggregate(Emissions ~ year + fips, data, sum)

# plot
png("plot6.png")
ggplot(total, aes(x=year, y=Emissions, color=fips)) +
  geom_line() +
  geom_point() +
  ggtitle("Motor Vehicle Emissions: Baltimore vs LA (1999-2008)")
dev.off()