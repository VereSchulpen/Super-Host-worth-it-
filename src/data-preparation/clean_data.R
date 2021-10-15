######################
#### CLEAN DATA ######
######################

#Load library
library(tidyverse)
library(gtsummary)

# Create a copy in gen/input
dir.create("./gen")
dir.create("./gen/data-preparation")
dir.create("./gen/data-preparation/input")
file.copy("./data/dataset1/venice1.csv","./gen/data-preparation/input/venice1.csv")

#Load dataset into R
df1 <- read.csv("./gen/data-preparation/input/venice1.csv")

######### data cleaning -> df_cleaned (first stage) ################

#Remove variables we don't need
df_cleaned <- df1[c("id", "host_id", "host_is_superhost", "accommodates", "bedrooms", "beds", "price", "number_of_reviews", "review_scores_rating", "reviews_per_month")]  
lapply(df_cleaned, class)
summary(df_cleaned)

# Transform df_cleaned$bedrooms, df_cleaned$bed, df_cleaned$price  into a numeric variable
df_cleaned$bedrooms_numeric <- as.numeric(gsub('[,]', '', df_cleaned$bedrooms))
df_cleaned$beds_numeric <- as.numeric(gsub('[,]', '', df_cleaned$beds))
df_cleaned$price_numeric <- as.numeric(gsub('[$,]', '', df_cleaned$price))

#Rename the independent variable host_is_superhost -> superhost
df_cleaned <- df_cleaned %>% rename(superhost = host_is_superhost)

# transform superhost into logical 
df_cleaned$superhost <- ifelse(df_cleaned$superhost == 't', TRUE, FALSE)

#Transform df_cleaned$superhost into a binary variable
df_cleaned$superhost_binary <- ifelse(df_cleaned$superhost == TRUE, 1, 0)
df_cleaned$superhost_binary [is.na(df_cleaned$superhost_binary)] <- 0

# search and remove if there are duplicated id's 
df_cleaned <- df_cleaned[!duplicated(df_cleaned$id), ]

# search and remove if there are N/A's in the DV (price) 
df_cleaned <- df_cleaned[!is.na(df_cleaned$price), ] 
# Do the same to remove N/A's in the column bedrooms and beds, while if there is no bedroom or bed -> guests have no place to sleep. 
df_cleaned <- df_cleaned[!is.na(df_cleaned$bedrooms), ]
df_cleaned <- df_cleaned[!is.na(df_cleaned$beds), ]

# search if there are price value's equal to $0
which(df_cleaned$price_numeric == 0) # these were not found
# search if there are bedrooms and bed value's equal to $0
which(df_cleaned$bedrooms_numeric == 0) # these were not found
which(df_cleaned$beds_numeric == 0) # a lot of rows with bed value 0 were found
# select only observations for bed value's not equal to 0
df_cleaned <- df_cleaned %>% filter(beds != 0)


######### data cleaning -> df1_cleaned, df2_cleaned, df3_cleaned, df4_cleaned, df5_cleaned, df6_cleaned (second stage) ################
df_cleaned1 <- df_cleaned %>% filter(price_numeric > 0 & price_numeric <= 50)
df_cleaned2 <- df_cleaned %>% filter(price_numeric > 50 & price_numeric <= 100)
df_cleaned3 <- df_cleaned %>% filter(price_numeric > 100 & price_numeric <= 150)
df_cleaned4 <- df_cleaned %>% filter(price_numeric > 150 & price_numeric <= 200)
df_cleaned5 <- df_cleaned %>% filter(price_numeric > 200 & price_numeric <= 250)
df_cleaned6 <- df_cleaned %>% filter(price_numeric > 250)

# Save cleaned data
dir.create("./gen/data-preparation/output")
save(df_cleaned,file="./gen/data-preparation/output/data_cleaned.RData")
dir.create("./gen/paper1")
dir.create("./gen/paper1/input")
save(df_cleaned,file="./gen/paper1/input/data_cleaned.RData")


