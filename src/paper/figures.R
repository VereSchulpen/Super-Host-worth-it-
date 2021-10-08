######################
#### CLEAN DATA ######
######################
#Load library
library()

# Boxplot of the Dependent variable: price_numeric
boxplot(df_cleaned$price_numeric)

# Barplot of the Indepedent variable: host_is_super_binary
ggplot(df_cleaned, aes(host_is_superhost_binary)) + geom_bar(aes(y = (..count..)/sum(..count..)*100)) + ylab("percentage")
