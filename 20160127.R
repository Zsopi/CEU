library(dplyr)
library(ggplot2)

str(mtcars)
table(mtcars$carb)
table(mtcars$hp)
ggplot(data = mtcars) + geom_bar(aes(x = carb/am))
ggplot(data = mtcars) + geom_bar(aes(x = carb/am)) + facet_grid(~ am)
mtcars$am <- as.factor(mtcars$am)
ggplot(data = mtcars, aes(x = carb, fill = am)) + geom_bar(position = 'dodge')
mtcars$am <- as.numeric(mtcars$am)
ggplot(data = mtcars) + geom_boxplot(aes(x = factor(carb), y = hp))
ggplot(data = mtcars) + geom_boxplot(aes(x = hp, y = wt, col = factor(carb))) + geom_point()


df <- readHTMLTable(readLines('https://en.wikipedia.org/wiki/FTSE_100_Index'), which = 2, header = TRUE)
str(df)
df <- readHTMLTable(readLines('https://en.wikipedia.org/wiki/FTSE_100_Index'), which = 2, header = TRUE, stringsAsFactors = FALSE)
str(df)
names(df)
colnames(df)[4] <- 'Cap'
str(df)
df$Cap <- as.numeric(df$Cap)
df$Employees <- as.numeric(gsub(',', '', df$Employees))
str(df)

subset(df, Employees < 1000)
subset(df, Employees < 1000 & Cap < 5)

