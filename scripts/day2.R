## R course day 2
## 29 Sept 2015


# load packages ---------------------------------------

library(ggplot2)


# load gapminder data ---------------------------------

gapminder <- read.csv("data/gapminder.csv")


# subsetting review -----------------------------------

# methods of subsetting
# x[a] for vectors

x <- c(10:1)
x
x[3]

# x[a, b] matrices, data.frames, not lists
x <- list(c(1:10), c(10:20))
x
x[1,2]

# x["a"] or x["a",] vector, data frame, or matrix with names
x <- c(1:10)
names(x) <- letters[1:10]
x
x["b"]

# x[[a]] for lists and data frames
x <- list(c(1:10), c(10:20))
x
x[[1]]

# x$a
names(x) <- c("one", "two")
x
x$two

## more complex subsetting
# >, <, ==

gapminder[gapminder$country == "Brazil", ]

x <- c(1:10)
x
x[x > 7]
x[x < 3]

# %in%

x <- c(1:10)
names(x) <- letters[1:10]
x

# this doesn't work
x == c(4, 5, 6)

# so you need to use the %in% operator
x[x %in% c(4, 5, 6)]

x[names(x) %in% c("d", "e", "f")]

## Challenge Questions

# incorrect version
gapminder[gapminder$year = 1957,]

# correct version
gapminder[gapminder$year == 1957,]

# incorrect version
gapminder[,-1:4]

# correct version
gapminder[,-(1:4)]
gapminder[-(1:4)]

# incorrect
gapminder[gapminder$lifeExp > 80]

# correct
gapminder[gapminder$lifeExp > 80, ]

# incorrect
gapminder[1, 4, 5]
gapminder[1, gapminder$lifeExp, gapminder$gdpPercap]

# correct
gapminder[1, c(4, 5)]
gapminder[1, c("lifeExp", "pop")]

# incorrect
gm <- gapminder[gapminder$year == 2002 | 2007,]
head(gm)
gm$year

# correct
g1 <- gapminder[gapminder$year == 2002,]
g2 <- gapminder[gapminder$year == 2007,]
rbind(g1, g2)

gm2 <- gapminder[gapminder$year == 2002 | gapminder$year == 2007,]
head(gm2)
gm2$year

gapminder$year %in% c(2002, 2007)
gm3 <- gapminder[gapminder$year %in% c(2002, 2007),]



## prefix
sum(2, 3)
## infix
2 + 3
## infix como um prefix
`+`(2, 3)


# plotting review -------------------------------------

## color by continent
ggplot(data = gapminder, aes(x = lifeExp, y = gdpPercap, colour = continent)) +
  geom_point()

## population
ggplot(data = gapminder, aes(x = year, y = pop, colour = continent, group = country)) +
  geom_point(colour = "black") +
  geom_line() +
  scale_y_log10()

## points on top of lines
ggplot(data = gapminder, aes(x = year, y = pop, colour = continent, group = country)) +
  geom_line() +
  geom_point(colour = "black") +
  scale_y_log10()

## split up by continent
ggplot(data = gapminder, aes(x = year, y = pop, colour = continent, group = country)) +
  geom_line() +
  geom_point(colour = "black") +
  scale_y_log10() +
  facet_wrap(~continent)

## example
ggplot(data = gapminder, aes(x = lifeExp, y = gdpPercap)) +
  geom_point() + scale_y_log10() + geom_smooth(method="lm", size=1.5)

## mudar a cor

ggplot(data = gapminder, aes(x = lifeExp, y = gdpPercap)) +
  geom_point(color = "black", size = 8, alpha = 0.1) + scale_y_log10() + geom_smooth(method="lm", size=1.5)

pdf(file = "figures/pdf_density_plot.pdf", height = 7)
ggplot(data = gapminder, aes(x = lifeExp, y = gdpPercap, color = country)) +
  geom_point(color = "green", size = 8) + scale_y_log10() + geom_smooth(method="lm", size=1.5)
dev.off()


## density plots
ggplot(data = gapminder, 
       aes(x = gdpPercap, fill = continent)) + 
  geom_density(alpha = 0.4) + 
  facet_wrap(~year) + 
  scale_x_log10() + 
  ggtitle("PIB por continente") +
  ylab("Densidade de PIB") +
  xlab("PIB") +
  scale_fill_manual(values = c("red","blue", "green", "yellow"))

## saving a plot
ggsave("figures/density_plot.pdf")
ggsave("figures/density_plot.jpg")

# multiple plots in a single document

pdf(file = "figures/pdf_multi_plot.pdf", height = 7)

ggplot(data = gapminder, aes(x = lifeExp, y = gdpPercap, color = country)) +
  geom_point(color = "green", size = 8) + scale_y_log10() + geom_smooth(method="lm", size=1.5)

ggplot(data = gapminder, aes(x = lifeExp, y = gdpPercap, color = country)) +
  geom_point(color = "green", size = 8) + scale_y_log10() + geom_smooth(method="lm", size=1.5) + facet_grid(~continent)

dev.off()

# png or jpg rather than pdf
png(file = "figures/png_plot.pdf", height = 7)

ggplot(data = gapminder, aes(x = lifeExp, y = gdpPercap, color = country)) +
  geom_point(color = "green", size = 8) + scale_y_log10() + geom_smooth(method="lm", size=1.5)

dev.off()

jpeg(file = "figures/jpg_plot.jpg", height = 7)

ggplot(data = gapminder, aes(x = lifeExp, y = gdpPercap, color = country)) +
  geom_point(color = "green", size = 8) + scale_y_log10() + geom_smooth(method="lm", size=1.5)

dev.off()

## multiplot
## grid.arrange
### gridExtra::grid.arrange()


# Working with data frames ----------------------------

# rbind and cbind can add rows and columns to data frames

iris
head(iris)

# add a new column 

iris$Family <- "Iridaceae"
head(iris)

# add a column using data from the data frame
iris$Petal.Area <- iris$Petal.Width * iris$Petal.Length
head(iris)

iris$Sepal.Area <- with(iris, Sepal.Width * Sepal.Length)
head(iris)

# summary stats
mean(iris$Petal.Width)
sd(iris$Petal.Width)
median(iris$Petal.Width)

mean_petal_width <- mean(iris$Petal.Width)
sd_petal_width   <- sd(iris$Petal.Width)

sd_petal_width/mean_petal_width


# R functions! ----------------------------------------


