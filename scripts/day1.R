# R course in Rio
## by Andrew and Alathea
## September 2015
## tudo bom

## simple math
2 + 2
2 * 3
3 ^ 10
4 / 5

## objects
x <- 5
x * 2
x ^ 3

## math functions
x ^ 10
log(x)
log10(x)
sin(30)

?sin

x > 2
x < 3
x == 5
x <- 1000
x

## challenge!
mass <- 47.5
age <- 122
mass <- mass * 2.3
age <- age - 20
mass
age
mass > age
age < mass


## Data types

# logical
a <- TRUE
b <- FALSE

# integer

c <- 5L

# double

d <- 5

# complex number

e <- 1 + 2i
e

# character

f <- "cat"

## What type of data type do I have?
typeof(c)
typeof(d)

is.integer(c)
is.double(c)
is.character(c)
is.logical(c)
is.complex(c)

## Data structures

# Vector

vec1 <- vector("character")
vec2 <- vector("character", length = 5)

vec3 <- c(1, 2, 3, 4, 5)
vec3

vec4 <- c(0:100)
vec4

vec5 <- seq(0, 100, by = 0.5)
vec5

vec6 <- c(TRUE, 10L, "cat")
vec6
typeof(vec6)

as.double(vec6)

## Getting information about an object's structure

x <- 0:10000

length(x)
str(x)
head(x)
tail(x)

ages <- c(23, 24, 25, 32, 49)
ages

names(ages) <- c("Juliana", "Rodrigo", "Carlos", "Bella", "Andrew")

ages

typeof(ages)

ages2 <- c(23, 24, 25, 32, 49)
ages2

typeof(ages2)

## What is the difference between numeric and double?

x <- c(5, 6, 7, 8)
y <- c(5L, 6L, 7L, 8L)
x
y
is.numeric(x)
is.numeric(y)
typeof(x)
typeof(y)
is.double(x)
is.double(y)

## Matrices

x <- matrix(1:10, nrow = 5, ncol = 2)
x
str(x)

rownames(x) <- c("a", "b", "c", "d", "e")
colnames(x) <- c("a", "b")
x

x <- matrix(rnorm(18), nrow = 6, ncol = 3)
length(x)
x


x <- matrix(1:50, nrow = 10)
x

x <- matrix(1:50, ncol = 5, byrow = TRUE)
x

x <- matrix(1:50, ncol = 5, byrow = T)
x
T <- FALSE
x <- matrix(1:50, ncol = 5, byrow = T)
x

TRUE <- FALSE

TRUE <- 5

## Factors

x <- factor(c("yes", "no", "yes", "yes"))
x
typeof(x)
str(x)

x <- factor(c("case", "control", "control", "case"), levels = c("control", "case"))
x

str(x)

x <- matrix(1:50, nrow = 10)
str(x)

typeof(x)

y <- 1:50
typeof(y)
str(y)

## Lists: contain multiple data types

x <- list(1, "a", TRUE, 5L)
x

xlist <- list(name = "Iris Data", nums = 1:10, data = head(iris))
xlist

## Data Frame

df <- data.frame(a = c(1, 2, 3), b = c("a", "b", "c"), c = c(TRUE, FALSE, FALSE))
df

## Adding rows and columns to data frames

rbind(df, df)
cbind(df, df)

## combine two datasets
df1 <- data.frame(firstname = "Andrew",
                  lastname = "MacDonald",
                  age = 31)

df2 <- data.frame(firstname = "1000000",
                  lastname = "Letaw",
                  age = 30)

total <- rbind(df1, df2)
str(total)

### subsetting
#### taking out parts of larger objects

x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
names(x) <- c("a", "b", "c", "d", "e")
x
typeof(x)
is.double(x)
is.numeric(x)

x[1]
x
x[3]
c(3, 5)
x[c(3, 5)]

x[2:4]

x[c(1, 1, 1, 4)]
x[10]

x[5:1]

## skipping elements
x[-1]
x[-c(2, 4)]
x[c(-2, -4)]
-c(2,4)

## different ways to get 
# 
# b   c   d 
# 6.2 7.1 4.8 

x[2:4]
x[c(2,3,4)]
x[-c(1, 5)]
x[c("b", "c", "d")]
x[c(FALSE, TRUE, TRUE, TRUE, FALSE)]

## subsetting by name
x["a"]

is_it_b <- names(x) == "b"
x[is_it_b]

## for matching multiple things
names(x) %in% c("b", "c", "d")
names(x)
x[names(x) %in% c("b", "c", "d")]

### multiple conditions
a <- 1:10
a
a > 7
a[a > 7]
a[a < 7]
a[a <= 7]

TRUE & TRUE
FALSE & FALSE
TRUE & FALSE

c(TRUE, FALSE) | c(FALSE, TRUE)

1:5 * 2
1:5 * 1:5



###### CHALLENGE

x
## write a subsetting command to return the values in x that are greater than 4, AND less than 7
x[x > 4 & x < 7]
a <- x > 4
b <- x < 7
a
b
a & b
x[a & b]
as.character(100)

as.numeric(FALSE)
as.numeric(TRUE)

as.logical(0)
as.logical(200000)

## how many times is x greater than 6???
as.numeric(x > 6)

sum(x > 6)
x & TRUE

## matrices
set.seed(1)
m <- matrix(rnorm(6*4), ncol = 4, nrow = 6)
m
## first 3 rows
## second and third columns
m[1:3, c(2, 3)]
m[,3]
m[3, ]
m[1:2,]
m

## subsetting lists
xlist <- list(a = "UFRJ", b = 1:10, c = head(iris))
xlist

xlist[1]
xlist["a"]
xlist$a
xlist[[1]]
xlist[["a"]]

uni1 <- xlist[1]
uni2 <- xlist[[1]]
uni1
uni2
typeof(uni1)
typeof(uni2)

newobj <- xlist[["b"]]
newobj[2]
xlist[["b"]][2]

## reading in data
gapminder <- read.csv("gapminder.csv")

str(gapminder)

gapminder[ ,"pop"]
gapminder$pop
gapminder[["pop"]]

gapminder[1:2, ]

BRASIL <- gapminder$country == "Brazil"
gapminder[BRASIL,]


## plotting
library(ggplot2)

## life expectancy and GDP
ggplot(data = gapminder, aes(x = lifeExp, y = gdpPercap)) + geom_point()

## GDP over time
ggplot(data = gapminder, aes(x = year, y = gdpPercap)) + geom_point()

## colour by country 
ggplot(data = gapminder,
       aes(x = lifeExp,
           y = gdpPercap,
           color = country)) +
  geom_point()

## line plots
ggplot(data = gapminder,
       aes(x = year,
           y = lifeExp,
           color = country)) +
  geom_line() +
  geom_point()

## line plots
ggplot(data = gapminder,
       aes(x = year, y = lifeExp)) +
  geom_line(aes(colour = country)) + 
  geom_point(color = "blue")

## switch the order
ggplot(data = gapminder,
       aes(x = year, y = lifeExp))  + 
  geom_point(color = "blue") +
  geom_line(aes(colour = country))

## transformations and statistics

ggplot(gapminder, aes(x = lifeExp, y = gdpPercap)) +
  geom_point() +
  scale_y_log10() + 
  stat_smooth(method = "lm")


ggplot(gapminder, aes(x = lifeExp, y = gdpPercap, colour = continent)) +
  geom_point() +
  scale_y_log10() + 
  stat_smooth(method = "lm")

gm90 <- gapminder[gapminder$year > 1990, ]
head(gm90)

ggplot(gm90, aes(x = lifeExp, y = gdpPercap)) + 
  geom_point() +
  scale_y_log10() +
  geom_smooth(method = "lm") +
  facet_grid(continent~year)

