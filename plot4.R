# load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# find coal sources
coal_sources <- SCC[grepl("coal", SCC$Short.Name, ignore.case = TRUE), ]

# merge with NEI
merged <- merge(NEI, coal_sources, by = "SCC")

# total emissions per year
total <- aggregate(Emissions ~ year, merged, sum)

# plot
png("plot4.png")
plot(total$year, total$Emissions,
     type = "b",
     xlab = "Year",
     ylab = "Emissions",
     main = "Coal Combustion Emissions in US (1999-2008)")
dev.off()