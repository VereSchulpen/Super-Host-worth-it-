######################
#### CLEAN DATA ######
######################
#Load library
library(tidyverse)
library(gtsummary)

# Create a copy in gen/input
dir.create("./gen/data-preparation/input")
file.copy("./data/dataset1/venice1.csv","./gen/data-preparation/input/venice1.csv")

#Load dataset into R
df1 <- read.csv("./gen/data-preparation/input/venice1.csv")

#Remove variables we don't need
df_cleaned <- df1[c("id", "host_id", "host_is_superhost", "property_type", "room_type", "bedrooms", "beds", "price", "number_of_reviews", "review_scores_rating", "reviews_per_month")]  

# search and remove if there are duplicated id's 
df_cleaned <- df_cleaned[!duplicated(df_cleaned$id), ]

# search and remove if there are N/A's in the DV (price) and IV (host_is_superhost)
df_cleaned <- df_cleaned[!is.na(df_cleaned$host_is_superhost), ]
df_cleaned <- df_cleaned[!is.na(df_cleaned$price), ] 
# Do the same to remove N/A's in the column bedrooms, while if there is no bedroom guests can't sleep. 
df_cleaned <- df_cleaned[!is.na(df_cleaned$bedrooms), ]

# Transform df_cleaned$price into a numeric variable
df_cleaned$price_numeric <- as.numeric(gsub('[$,]', '', df_cleaned$price))

# transform host_is_superhost into logical 
df_cleaned$host_is_superhost <- ifelse(df_cleaned$host_is_superhost == 't', TRUE, FALSE)

# search if there are price value's equal to $0
which(df_cleaned$price_numeric == 0) # these were not found
# search if there are bed value's equal to $0
which(df_cleaned$beds == 0) # a lot of rows with bed value 0 were found
# select only observations for bed value's not equal to 0
df_cleaned <- df_cleaned %>% filter(beds != 0)

#Transform df_cleaned$host_is_superhost into a binary variable
df_cleaned$host_is_superhost_binary <- ifelse(df_cleaned$host_is_superhost == TRUE, 1, 0)
df_cleaned$host_is_superhost_binary [is.na(df_cleaned$host_is_superhost_binary)] <- 0

# Save cleaned data
dir.create("./gen/data-preparation/output")
save(df_cleaned,file="./gen/data-preparation/output/data_cleaned.RData")

