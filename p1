#top 10 streets with max crimes
#load the library
library(mongolite)

#to create a connection between
my_collection = mongo(collection = "Crimes", db = "TYIT2024")

#counts the number of records
#my_collection$count()
my_collection$count('{"Location Description":"STREET"}')

#finds and displays the records
my_collection$find('{"Location Description":"STREET"}')

library(dplyr)
#places where maximum crimes
top_crimes = my_collection$aggregate(
  '[{
      "$group":{"_id":"$Location Description","Total_Crimes": { "$sum": 1 }}
  }]') %>% na.omit %>% arrange(desc(Total_Crimes)) %>% head(10)

library(ggplot2)
ggplot(top_crimes, aes(x = reorder(`_id`, Total_Crimes), y = Total_Crimes)) +
  geom_col(fill = "skyblue") +  # Create the bars
  geom_text(aes(label = Total_Crimes), vjust = -0.3) +  # Add text labels above the bars
  labs(x = "Street", y = "Crime Count", title = "Top 10 Streets with Maximum Crimes") +
  coord_flip() 
