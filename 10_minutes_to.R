# 10 Minutes to R

#-----------------------------------------------
## R as a calculator
2 + 2

50 - 5*6

(50 - 5*6) / 4

8/5

17/3

2^8 

17 %/% 3

## Operators
# + addition
# - subtraction
# * multipliation
# / division
# ^ or ** exponentiation
# x %% y modulus
# x %/% y integer division 

## Logical Operators (TRUE/FALSE)
# <      less than
# <=     less than or equal to
# >      greater than
# >=     greater than or equal to
# ==     equals (comparison)
# !=     not equal
# !x     not x
# x | y   x OR y
# x & y   x AND y

## Math functions / constants
# log(x)  natural log or in specified base
# exp(x)  exponential
# pi      value of pu

#-----------------------------------------------
## Creating variables
width = 20
width
height = 5 * 9
width * height

ls() # show the objects in memory
widith = 10 #oops
ls()
rm(widith)
ls()

#-----------------------------------------------
## Types of Data

# most common:
# numeric    3, 5.2, etc
# boolean    TRUE, FALSE
# character  e.g. string
# factor     categorical variable - data value is one of a small set of possible values
# date[time] represents a date or specific date and time. 

5           # numeric
TRUE        # Boolean / Logical 
"I Like R"  # character(s) / string

# Data type determines what you can do with the data

5 * 2 # perfectly sensible

"I like R" 
'I like R'  # single or double quotes

"I like R" * 2  # nonsensical
"I" + "like" + "R" # python style concat does not work
paste("I", "like", "R")


as.Date("2022-05-17")
this_day = as.Date("2022-05-17")
yesterday =  as.Date("2022-05-16")
this_day
yesterday
this_day < yesterday  #? Was today before yesterday?
                      # Why did us "this_day" for today? (namespace)
                      # Will discuss in pain points sections
format(as.Date("2022-05-17"), '%B %d %Y')



#-----------------------------------------------
## Data Containers (Objects)

# values more useful when stored as a collection in a container

### Single Type Containers
#  - vector v[i]
#  - matrix m[i,k]
#  - array  a[i,j,k,.....] 

### Multi-type Containers
#  - Lists
#  - Data Frames

### Convert between containers using as.*() methods
#### e.g: as.list(), as.data.frame()

#-----------------------------------------------
# vector (like a column of data table)
# vector has one dimension
## like a data table column, the elements of a vector should
## all be the of the same kind (numeric, boolean, string, etc).
my_vec = c(8, 6, 7, 5, 3, 0, 9)
my_vec

## First element is at index 1. Last element is at length(my_vec)
my_vec[1]
length(my_vec)
my_vec[7]
my_vec[1:3]  # ranges are 

# Most R operators and functions support vector input
my_vec^2
my_vec + my_vec
my_vec * my_vec   # pairwise, vector multiplication

# If you ask R to make a vector of mixed types,
# R automatically (and silently) finds a common data type 
mixed = c("R", TRUE, 10)
mode(mixed)
mixed # everything is string!

mixed2 =c(1, 2, 3, TRUE)
mode(mixed2)
mixed2 # Boolean is now an int!


?seq
seq(from=1, to=10, by=1)
1:10
my_seq = seq(from=1, to=10, by=1)

c(TRUE, TRUE, FALSE, TRUE)
my_seq %% 2 == 0
my_bool_vec = my_seq %% 2 == 0


#-----------------------------------------------
# matrix has two dimensions
vals = 1:9
vals
mat1 = matrix(vals, nrow = 3, byrow = TRUE)
mat1

my_mat = my_vec %*% t(my_vec)
mode(my_mat)
my_mat

mat2 = matrix(c('a','b','c','d'), nrow=2)
mat2

# stack of vectors   --> matrix
# stack of matrices --> array

#-----------------------------------------------
# Mixed type containers

## list
### Commonly used to hold results of a statistical analysis
### e.g. fitting a regression model returns a list-like model object


my_list = list(
  "I like R",
  as.Date("2022-05-16"),
  20,
  c(8, 6, 7, 5, 3, 0, 9)   #no comma after last arg (cf python)
)
my_list

for (elem in my_list) {
  print(class(elem))
}

my_list[[1]]          # first list item
my_list[[4]][1:3]     # first 3 elements of fourth list item


### name the items for ergonomics
my_list2 = list(
  message = "I like R",
  yesterday =  as.Date("2022-05-16"),
  width = 20,
  my_vec = c(8, 6, 7, 5, 3, 0, 9)  #no comma after last arg (cf python)
)
my_list2
my_list2$message     # "message" element
my_list2$my_vec[1:3] # first 3 items from my_vec element

## Data Frames 
### data.frame - familiar rows as cases and columns as variables format
### holds the same kind of data that would be stored in
### an Excel sheet, CSV, Pandas DataFrame, etc 

## data.frame is regular built-in data structure
## data.table - adds large data features to data.frame 
## tibble - frame-like with strict checking (less auto help)

# similar syntax to lists, but columns should be same length
## a data.frame with three columns (id, age, height)
my_df = data.frame(
  id = 1:9,
  age = round(runif(9, 8, 12)),
  height = round(runif(9, 38, 60), 1)
)

my_df
my_df[1,]    #first row
my_df$age    #column "age"

my_df$gender = "boy"
my_df
my_df$gender[5:9] = "girl"
my_df

summary(my_df)

my_df$gender = as.factor(my_df$gender)
summary(my_df)

head(my_df)  # show the first 6 rows of the data frame (good for large data frames)

mean(my_df$age)
sd(my_df$age)








