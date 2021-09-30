#Load dataset into R
df1 <- read.csv("./gen/data-preparation/input/venice1.csv")

#Save data
save(df1,file="./gen/data-preparation/temp/data_temp.RData")
