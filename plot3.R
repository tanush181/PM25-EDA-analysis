library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")

baltimore <- subset(NEI, fips == "24510")

total <- aggregate(Emissions ~ year + type, baltimore, sum)

png("plot3.png")
ggplot(total, aes(x=year, y=Emissions, color=type)) +
  geom_line() +
  geom_point() +
  facet_wrap(~type) +
  ggtitle("Emissions by Source Type in Baltimore")
dev.off()