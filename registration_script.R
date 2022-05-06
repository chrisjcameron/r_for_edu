require(ggplot2)
require(dplyr)
require(lubridate)

# load a data table with select columns 
# from the registration data for this workshop 
df = read.csv("./registration.csv")

# At this point, it looks like nothing has happened. 

# Data is loaded:
dim(df)
names(df)

# You can inspect the data table in Environment tab.
View(df)

# This is not the R way. 
summary(df)
head(df)

# The Registered.on column is of type character
# but it represents a date and time. 
df$Registered.on

# We should convert to a datetime
# the mdy_hm function from the lubridate package is a convenient choice

# For example:
mdy_hm("04/22/2022 14:51 UTC")

# Note: Many functions work on entire data columns (vectors)
mdy_hm(df$Registered.on)

# Lets update that column
df$Registered.on = mdy_hm(df$Registered.on)

summary(df)


plot_df = df %>% filter(Registered.on > ymd_hm("20220422 14:00"))
(
  ggplot(plot_df, aes(x=Registered.on))
  #+ geom_histogram(binwidth = 600) #600 s = 10 minutes
  + geom_freqpoly(binwidth = 600) #600 s = 10 minutes
  + theme_bw()
  + ggtitle("Registration for R workshop")
)

df %>% count(Position, sort = TRUE) 
 
