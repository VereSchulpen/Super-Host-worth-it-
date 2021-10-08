######################
#### CLEAN DATA ######
######################
#Load library
library(ggplot2)

# Boxplot of the Dependent variable: price_numeric
boxplot(df_cleaned$price_numeric)

# Barplot of the Indepedent variable: host_is_super_binary
ggplot(df_cleaned, aes(host_is_superhost_binary)) + geom_bar(aes(y = (..count..)/sum(..count..)*100)) + ylab("percentage")

# combination of DV and IV in one boxplot
ggplot(df_cleaned, aes(x=as.factor(host_is_superhost_binary), y=price_numeric)) + geom_boxplot()

