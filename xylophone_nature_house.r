#Create a data frame with information on countries
world_data <- data.frame(Name = c("United States", "Germany", "China", "India", "Japan", "United Kingdom"),
                         Continent = c("North America", "Europe", "Asia", "Asia", "Asia", "Europe"),
                         Population = c(323947000, 82175684, 1403500365, 1311050527, 126476458, 66181585),
                         GDP_per_capita = c(55632.34, 45630.79, 16014.48, 5730.11, 43791.27, 46426.84))

#View the data
head(world_data)

#Rename the Name column to Country
names(world_data)[1] <- "Country"

#Install a data visualization package
install.packages("ggplot2")

#Load the package
library(ggplot2)

#Plot the GDP per capita by country
ggplot(world_data, aes(x=Country, y=GDP_per_capita)) + 
  geom_col() +
  coord_flip() +
  labs(title="GDP per Capita by Country", y="GDP per Capita", x="Country")

#Output plot to a file
ggsave("GDP_per_Capita_by_Country.png")

#View the top 5 countries by population
head(world_data[order(world_data$Population, decreasing = TRUE), ], 5)

#Create a variable for population percent
world_data$Population_Pct <- world_data$Population/sum(world_data$Population)

#Discover the percent of population for the top 3 countries
head(world_data[order(world_data$Population, decreasing = TRUE), ], 3)$Population_Pct

#Create pie chart to visualize population by country
ggplot(world_data, aes(x=1, y=Population_Pct, fill=Country)) + 
  geom_bar(width=1, stat="identity") +
  coord_polar("y", start=0) + 
  labs(title="Population Percent by Country", fill="Country")

#Output pie chart to a file
ggsave("Population_Pct_by_Country.png")

#Group data by continent
grouped_data <- aggregate(GDP_per_capita ~ Continent, data = world_data, FUN=mean)

#View the average GDP per capita by continent
head(grouped_data)

#Create bar chart to visualize GDP per capita by continent
ggplot(grouped_data, aes(x=Continent, y=GDP_per_capita)) + 
  geom_col() +
  labs(title="Average GDP per Capita by Continent", y="GDP per Capita", x="Continent")

#Output bar chart to a file
ggsave("GDP_per_Capita_by_Continent.png")

#Install and load a package to make maps
install.packages("cartography")
library(cartography)

#Create a map to visualize locations
mapWorld <- getMap(resolution="low")

#Create the map
mapCountry <- ggplot() +
    geom_polygon(data=mapWorld, aes(long, lat, group = group), color="gray", fill="white") +
    geom_point(data=world_data, aes(x=Country, y=GDP_per_capita, size=Population, color=Continent), shape=21) +  
    scale_size(range = c(2, 10)) +
    coord_quickmap() +
    labs(title="GDP per Capita by Country", color="Continent", size="Population")

#Output map to a file
ggsave("GDP_per_Capita_by_Country_Map.png")