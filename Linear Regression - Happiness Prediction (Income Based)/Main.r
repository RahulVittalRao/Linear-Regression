library(ggplot2)
library(dplyr)
library(broom)
library(ggpubr)

income.data <- na.omit(data.frame(read.csv("D:/Source Programs/Data Science and ML with Python and R/Linear Regression - Happiness Prediction (Income Based)/income.data.csv")))

summary(income.data)
hist(income.data$happiness)
plot(happiness ~ income, data = income.data)

income.happiness.lm <- lm(happiness ~ income, data = income.data)

summary(income.happiness.lm)

income.graph<-ggplot(income.data, aes(x=income, y=happiness))+geom_point()
income.graph

income.graph <- income.graph + geom_smooth(method="lm", col="black")
income.graph

income.graph <- income.graph + stat_regline_equation(label.x = 3, label.y = 7)
income.graph

income.graph + theme_bw() + labs(title = "Reported happiness as a function of income", x = "Income (x$10,000)", y = "Happiness score (0 to 10)")
print("I found a significant relationship between income and happiness (p < 0.001, R2 = 0.73 ± 0.0193), with a 0.73-unit increase in reported happiness for every $10,000 increase in income.")