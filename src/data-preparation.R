# Loading and inspecting data
install.packages("RCurl")
library (RCurl)
Venice_cvs <- getURL("https://docs.google.com/spreadsheets/d/1HYUZRLB7-KCr5jwXQnl3OH4KSReK1HO9LmKbU7f3V5c/edit#gid=402527890")
Venice_data <- read.csv (text = Venice_cvs)

View(Venice_data)
summary(Venice_data)

# Data cleaning and transformation
Venice_data <- Venice[ c("id","host_id","host_is_superhost","host_listings_count","property_type","room_type","price","minimum_nights","number_of_reviews","review_scores_rating","reviews_per_month") ]
View(Venice_data)
# make an excel file of the new created dataframe : Venice_data
write.csv(Venice_data,"C:\\Users\\DAVE\\MA\\dPrep\\Venice_data.csv", row.names = FALSE)
# inspect the data again
summary(Venice_data)

# Names of columns
colnames(Venice_data)

# Convert into data
# Dependent variable transformation -> make the variable numeric
Venice_data$Venice_data_price_num <- as.numeric(gsub("[$,]","", Venice_data$price)) 
# Independent variable transformation -> make the variable binary with 1 = superhost and 0 = non-superhost
Venice_data$host_is_superhost_TRUE <- ifelse(Venice_data$host_is_superhost == 'TRUE', 1, 0)
Venice_data$host_is_superhost_TRUE[is.na(Venice_data$host_is_superhost_TRUE)] <- 0 

# data exploration
# scatter plot first try
plot(x = Venice_data$host_is_superhost_TRUE, # horizontal
     y = Venice_data$Venice_data_price_num, # vertical
     col = "green", # color
     type = "p") # line chart 

# scatter plot nice design
library(ggplot2)
ggplot(Venice_data, aes(x=as.factor(host_is_superhost_TRUE), y=Venice_data_price_num)) + geom_boxplot()

# percentage of non-superhost vs superhost
ggplot(Venice_data, aes(host_is_superhost_TRUE)) + geom_bar(aes(y = (..count..)/sum(..count..)*100)) + ylab("Percentage")
barplot(table(Venice_data$host_is_superhost_TRUE)/sum(table(Venice_data$host_is_superhost_TRUE))*100)
