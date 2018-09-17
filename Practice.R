library(ggplot2)
data(diamonds)
summary(diamonds)
names(diamonds)
levels(diamonds)
str(diamonds)
levels(diamonds$color)
?diamonds


#histgram of price
qplot(x=price, data=diamonds)
mean(diamonds$price)


Less500 <- subset(diamonds, diamonds$price < 500)
less250 <- subset(diamonds, diamonds$price < 250)

less15000 <- subset(diamonds, diamonds$price >= 15000)

?length

length(diamonds$price)

length(less250$price)


#explore the largest peak in teh price histogram
qplot(x = price, data = diamonds) +
  scale_x_continuous(limits = c(1,1700), breaks = seq(1,1700,50)) +
  stat_bin(aes(y=..count.., label=..count..), geom='text', vjust=-.5)
#source:https://stackoverflow.com/questions/23768546/how-to-show-count-of-each-bin-on-histogram-on-the-plot

ggsave('pricepeakhistgram.png')


library(gridExtra)
ggplot(diamonds, aes(x = price)) +
  geom_histogram() +
  facet_grid(~cut)

ggplot(diamonds, aes(x = price)) +
  geom_histogram() +
  facet_wrap(~cut)
#source: https://stackoverflow.com/questions/34044725/r-split-histogram-according-to-factor-level

by(diamonds$price, diamonds$cut, summary)
