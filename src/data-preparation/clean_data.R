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

#Transform price to numeric variable
library(tidyverse)
df_cleaned <- df_cleaned %>%  
  mutate(price = str_remove_all(price, fixed("$"))) %>% 
  mutate(price = str_remove_all(string = price, pattern = fixed(","))) %>% 
  mutate(as.numeric(x = price))

# Save cleaned data
dir.create("./gen/data-preparation/output")
save(df_cleaned,file="./gen/data-preparation/output/data_cleaned.RData")

