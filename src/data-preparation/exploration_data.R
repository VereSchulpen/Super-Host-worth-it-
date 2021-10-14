# To get an overview of the cleaned data
summary(df_cleaned)

# Calculate the average price of a room in Venice
mean(df_cleaned$price_numeric)

# Compare the price of a specific host with the average price of all hosts in Venice
# So a we can see if the host is priced above the average or below the average
		if(df_cleaned$price_numeric[1] > mean(df_cleaned$price_numeric)){
		  print("This room is priced above the average price")
		} else {
		  print("This room is priced below the average price")
		}

