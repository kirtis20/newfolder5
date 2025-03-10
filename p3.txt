#crimes hour wise on each day of week
#load the library
library(mongolite)

#to create a connection between
my_collection = mongo(collection = "Crimes", db = "TYIT2024")

domestic$Hours = hour(domestic$Date)

# Extract the Day of the Week
domestic$DayOfWeek = weekdays(domestic$Date)

week = domestic %>% group_by(domestic$Hours, domestic$DayOfWeek) %>% count(domestic$Hours)

ggplot(week, aes(x=week$`domestic$Hours`, y=week$n)) +
  geom_line(aes(group=week$`domestic$DayOfWeek`, color=week$`domestic$DayOfWeek`), size=0.5) +
  xlab("Hour") + ylab("Frequency") +
  ggtitle("Crimes according to the weekday")


##crimes hour wise on saturday and sunday
# Load the necessary library
library(mongolite)
library(dplyr)
library(ggplot2)
library(lubridate)

# Create a connection (assuming domestic dataset is already loaded)
my_collection = mongo(collection = "Crimes", db = "TYIT2024")

# Extract Hour and Day of Week
domestic$Hours = hour(domestic$Date)
domestic$DayOfWeek = weekdays(domestic$Date)

# Filter only weekends (Saturday and Sunday)
weekend_data = domestic %>%
  filter(DayOfWeek %in% c("Saturday", "Sunday")) %>%
  group_by(Hours, DayOfWeek) %>%
  count(Hours)

# Plot
ggplot(weekend_data, aes(x=Hours, y=n)) +
  geom_line(aes(group=DayOfWeek, color=DayOfWeek), size=0.5) +
  xlab("Hour") + ylab("Frequency") +
  ggtitle("Crimes on Weekends (Saturday & Sunday)")
