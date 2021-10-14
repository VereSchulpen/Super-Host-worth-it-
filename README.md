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
the dataset is as follows listings.csv.gz. This raw data file will programmatically downloaded from google drive. In the dataset all kinds of data about hosts across a city can 
be retrieved, it has 7947 observations and 76 variables. To narrow down the dataset, all columns (variables) will be removed that 
are definitely not of any value to this research. Resulting into a dataset that has been reduced to 10 columns. 

The research has been split up in two stages. 
In the first stage the use of the whole cleaned dataset will be used. Whereas, in the second stage the dataset will be split into six different dataset based on the price 
classes: > $ 0 to $ 50, > $ 50 to $ 100, > $ 100 to $ 150, > $ 150 to $ 200, > $ 200 to $ 250 and > $ 250


## Method and results
This chapter will first explain and motivate the proposed research method and afterwards state the conclusions. 

### Method
The research question of this study will be answered by using a correlational study looking at quantitative 
data. The correlational study aims to test if there is a correlation between the price variable and the 
host_is_supehost variable. For this, a simple linear regression will be used. This due to the fact that 
we have one independent variable and one depedent variable. 

The idea behind this analysis is that it will return an equation where the coefficients are given. When this 
equation is created, X1 can be filled in with either a 1 (for superhost) or a 0 (for non-superhost). The 
equation will then eventually calculate the average price asked by a superhost or non-superhost. Finaly, these 
results can be compared on wheter a host in Venice with the label superhost ask on average a higher or lower 
price than a host without the label of a superhost. 

Above the overall idea on how this research will go has been described. However, this research will be divided into two stages. 
In the first stage, it will analyse the whole cleaned dataset. Whereas, in the seconde stage the cleaned data set will be divided into 6 price classes (> $ 0 to $ 50, > $ 50 to 
$ 100, > $ 100 to $ 150, > $ 150 to $ 200, > $ 200 to $ 250 and > $ 250).
The idea behind this is to see if it differs to be a super host or not in different price classes, so to get a more specific view. 

### Results
First stage conclusion:
There are significant differences in the asking price between the two groups ( super host vs non-super host). Resulting that on average the price asked by a host with the label 
super host is $22.66 lower. 

Second stage conclusion:
In two price classes we see a significant difference in the average asking price between the two groups, in the price classes: > $ 100 to $ 150 and > $ 250. But for the outcome 
of the other price classes, it seems that the pricing does not matter whether you are a super host or not a super host. 

The detailed results can be found in the rendered RMarkdown file.


## Repository overview
The Repository consist of three folders: data, gen and src.

## Running instructions

Explain to potential users how to run/replicate your workflow. Touch upon, if necessary, the required input data, which (secret) credentials are required (and how to obtain them), which software tools are needed to run the workflow (including links to the installation instructions), and how to run the workflow. Make use of subheaders where appropriate.

## More resources

Point interested users to any related literature and/or documentation.

## About
This project is submitted in fulfillment of the requirements for the course [Data Preparation & Workflow Management](https://dprep.hannesdatta.com/)

Team 8: [Dave Jongenelen](https://github.com/Davejongenelen), [Alberto Maria Rizzuti](https://github.com/albirizzu), [Vere Schulpen](https://github.com/VereSchulpen), [Jaromir Weenink](https://github.com/JaromirW99)
