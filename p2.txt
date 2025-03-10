#frequency of domestic crimes by the day of the week
#load the library
library(mongolite)

#to create a connection between
my_collection = mongo(collection = "Crimes", db = "TYIT2024")

#counts the number of records where domestic is true
my_collection$count('{"Domestic":true}')
 
#print the records with only domestic and date column. _id will by default therefore to not print we write "_id":0
domestic = my_collection$find('{"Domestic":true}',fields = '{"_id":0,"Domestic":1, "Date":1}')
 
library(lubridate)
library(hms)
 
#converting to data frame
domestic = data.frame(domestic)
domestic$Date = mdy_hms(domestic$Date)

#weekdays() converts date to day
domestic$Weekday = weekdays(domestic$Date)

library(dplyr)
weekday_counts = domestic %>% count(Weekday) %>% arrange(factor(Weekday, levels = c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")))


library(ggplot2)
ggplot(weekday_counts, aes(x = Weekday, y = n, group = 1)) +  # 'group = 1' ensures it's treated as one continuous line
  geom_line(color = "blue", size = 1) + 
  labs(title = "Frequency of Domestic Crimes by Day of the Week",
       x = "Day of the Week",
       y = "Frequency") +
  scale_x_discrete(limits = c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))  # Ensure perfect order on the x-axis




#another way to write the last part 
library(dplyr)
weekday_counts = domestic %>% count(Weekday)
weekday_counts$Weekday = factor(weekday_counts$Weekday, ordered = TRUE,
                                levels = c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))

library(ggplot2)
ggplot(weekday_counts, aes(x = Weekday, y = n, group = 1)) +  # 'group = 1' ensures it's treated as one continuous line
  geom_line(color = "blue", size = 1) +
  labs(title = "Frequency of Domestic Crimes by Day of the Week",
       x = "Day of the Week",
       y = "Frequency") 
