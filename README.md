# Being a super-host: worth the effort?

__Research Question__
Is there a difference in pricing between super hosts and non-super hosts in Venice?

## Motivation
The purpose of this research is to figure out if there is a difference in pricing between hosts and super-hosts in Venice. Is choosing a Superhost over a host really worth the cost? And is there such a big difference between the two types of hosts?

First of all, we need to explain what "Superhosts" are. Those are experienced hosts who provide a shining example for other hosts and extraordinary experiences for their guests. Airbnb checks Superhosts’ activity four times a year, to ensure that the program highlights the people who are most dedicated to providing outstanding hospitality.

Why did we choose Venice? Venice is one of the three most visited cities in Italy with 12.948.519 of tourists in 2019 (ISTAT website - National Institute of Statistics, Nov, 2020) and with 7947 accommodations on Airbnb (Inside Airbnb, Aug 6, 2021). 

<img src="https://idsb.tmgrup.com.tr/ly/uploads/images/2021/06/23/123886.jpg" width="70%"> 

Price is one of the main factors guests consider when choosing where to stay. The price difference and competitiveness in the market leads hosts many times to change their pricing strategy. Usually Superhosts have more visibility and earning potential, but does this mean a higher price than a host without the Superhost label? In this research, we will investigate the correlation between pricing and type of host and as it may change the hosts' strategies.

Our results will help Airbnb hosts and Superhosts to get more information on pricing strategy and adjust it based on the type of hosts they are and the experiences they offer.

## Data
This research draws on a dataset from [Inside Airbnb](http://insideairbnb.com/get-the-data.html), the name of 
the dataset is as follows listings.csv.gz. This raw data file will programmatically downloaded from the 
internet. In the dataset all kinds of data about hosts across a city can be retrieved, it has 
7947 observations and 76 variables. To narrow down the dataset, all columns (variables) will be removed that 
are definitely not of any value to this research. The new created dataset called df_cleaned, consists of 12 
columns with still 7947 observations.

Next up, the data of this new created data set have to be cleaned. First the id numbers will be checked if 
there are any dupicated id numbers or id numbers that contain the value N/A. After that, the checking process 
of N/A values will continu in other columns, host_is_superhost, price and bedrooms. For the variables 
host_is_superhost and price this is important because it are the independent and dependent variable, 
respectively. For the variable bedroom we also want to check on N/A's because a host without bedrooms have to 
be excluded. Then the variable of price have to be made numeric, this is of high importance for the further 
part of the research. Also a check on values equal to zero have to be done, especially for the variable price 
which has prior been made numeric. But also the variables accommodates and beds have to be checked on zero 
value. If any of these variables contain a observation with the value zero it does not make sense to include 
such an observation to the dataset. Finally the indepedent variable, host_is_superhost, has to be transformed 
into a binary variable consisting of 2 levels (1 = superhost, 0 = non_superhost), a so-called dummy variable.

The cleaned dataset (df_cleaned) that will be used to analyse the research question contains 14 variables and 
7537 observations. 


## Method and results
### Method
This chapter will first explain and motivate the proposed research method and afterwards discuss the results. 

The research question of this study will be answered by using a correlational study looking at quantitative 
data. The correlational study aims to test if there is a correlation between the price variable and the 
host_is_supehost variable. For this, a simple linear regression will be used. This due to the fact that 
we have one independent variable and one depedent variable. 

It is of high importance to plot the inputs to visualize the shape of the effect. Data points that deviate 
significantly from the rest of the data turn up to be extreme data points, inaccuracies (Business Research, 
2021). Consequently, such an extreme data point should be removed. Furthermore, duplicated id's and values 
containing the values zero and N/A, regarding price and superhost, also should be removed from the dataset. 
The linear regression equation can be expressed as follows: Y= β0+ β1X1 + ε. Where 
β0 the coefficient of the constant term is, β1 coefficient is of the independent variable and ε is the error 
term. The significance of the coefficients needs to be tested to accept or reject the hypothesis, this will be 
done by using a t-test.

The idea behind this analysis is that it will return an equation where the coefficients are given. When this 
equation is created, X1 can be filled in with either a 1 (for superhost) or a 0 (for non-superhost). The 
equation will then eventually calculate the average price asked by a superhost or non-superhost. Finaly, these 
results can be compared on wheter a host in Venice with the label superhost ask on average a higher or lower 
price than a host without the label of a superhost. 

### Results
Firstly, the actual linear regression model was estimated, leading to the following equation: Y= 161.23 - 
22.66 * X1 + ε. Hereby we can compute a 1 (for superhost) or a 0 (for non-superhost) into the model. The 
findings were that the average price asked by a superhost is $138.57 per night and the average price asked by 
a non-superhost is $161.23. Meaning that on average, the price of a host with the label superhost is $22.66 
lower than a non-superhost. In addition, a correlation test indicated that there is no corrlation between 
being a superhost and the price (correlation -0.041), substantiated by the t-test that gave the result that 
the model was significant. However, the follow up question is then, why ask non-superhost on average a higher 
price or was the data set not cleaned up enough?

Therefore, the dataset has been divided based on price ranges. The following prices ranges were selected to 
get a more specific insight into the dataset: price > $0 and <= $50, $50 and <= $100, ... , price > $250. Resulting in almost 
no differences in asking price between a superhost and a host for the first 5 price ranges. However, in the 
last price range, price bigger than $250, a huge difference in asking price was spotted. The 
findings in this price range, were that the average price asked by a superhost is $450.81 per night and the 
average price asked by a non-superhost is $635.31. Meaning that on average, the price of a host with the label 
superhost is $184.50 lower than a non-superhost. This might be the cause for the slight difference in the 
price average of the whole dataset, as there is actually no correlation between the price and having a superhost label. 

The conclusion is that there is no difference in pricing between superhosts and non-superhost in Venice. 


## Repository overview

Provide an overview of the directory structure and files.

## Running instructions

Explain to potential users how to run/replicate your workflow. Touch upon, if necessary, the required input data, which (secret) credentials are required (and how to obtain them), which software tools are needed to run the workflow (including links to the installation instructions), and how to run the workflow. Make use of subheaders where appropriate.

## More resources

Point interested users to any related literature and/or documentation.

## About
This project is submitted in fulfillment of the requirements for the course [Data Preparation & Workflow Management](https://dprep.hannesdatta.com/)

Team 8: [Dave Jongenelen](https://github.com/Davejongenelen), [Alberto Maria Rizzuti](https://github.com/albirizzu), [Vere Schulpen](https://github.com/VereSchulpen), [Jaromir Weenink](https://github.com/JaromirW99)
