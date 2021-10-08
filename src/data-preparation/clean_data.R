######################
#### CLEAN DATA ######
######################
#Load library
library(tidyverse)

# Create a copy in gen/input
dir.create("./gen/data-preparation/input")
file.copy("./data/dataset1/venice1.csv","./gen/data-preparation/input/venice1.csv")

#Load dataset into R
df1 <- read.csv("./gen/data-preparation/input/venice1.csv")

#Remove variables we don't need
df_cleaned <- df1[,c(1, 9, 18, 22, 32, 33, 40, 42, 61, 74)]

# search and remove if there are duplicate id's 
df_cleaned <- df_cleaned[!duplicated(df_cleaned$id), ]

# search and remove if there are N/A's in the DV (price) and IV (host_is_superhost)
df_cleaned <- df_cleaned[!is.na(df_cleaned$host_is_superhost), ]
df_cleaned <- df_cleaned[!is.na(df_cleaned$price), ]

# search for price value's equal to $0
which(df1$price_numeric == 0) 
# search for the id of the host of the given rows
df_cleaned[c(6331, 6464, 6938),]
# remove the three founded rows based on their id
df_cleaned <-df_cleaned[!(df_cleaned$id=="42279260" | df_cleaned$id=="43205683" | df_cleaned$id=="45683814"),]


# Transform df_cleaned$price into a numeric variable
df_cleaned$price_numeric <- as.numeric(gsub('[$,]', '', df_cleaned$price))

# Save cleaned data
dir.create("./gen/data-preparation/output")
save(df_cleaned,file="./gen/data-preparation/output/data_cleaned.RData")

