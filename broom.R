data <- iris

# fitting a linear model to see dependence of sepal length on petal length

model1<- lm(Sepal.Length ~ Petal.Length , data = data)

# fitting a model to see the dependence of sepal width on petal width

model2<- lm(Sepal.Width ~ Petal.Width , data = data)

library(dplyr)
library(broom)

# we use BROOM to extract information from a model and save it as a data frame

tidy(model1)
#     term         estimate   std.error   statistic   p.value
#     <chr>           <dbl>     <dbl>       <dbl>     <dbl>
# 1 (Intercept)       4.31     0.0784      54.9     2.43e-100
# 2 Petal.Length      0.409    0.0189      21.6     1.04e- 47

tidy(model2)
#      term        estimate  std.error  statistic   p.value
#      <chr>          <dbl>     <dbl>      <dbl>     <dbl>
# 1 (Intercept)       3.31     0.0621      53.3    1.84e-98
# 2 Petal.Width      -0.209    0.0437     -4.79    4.07e- 6


## this makes it possible to combine multiple models
bind_rows(tidy(model1),tidy(model2))

#term         estimate std.error statistic   p.value
#<chr>           <dbl>     <dbl>     <dbl>     <dbl>
#1 (Intercept)     4.31     0.0784     54.9  2.43e-100
#2 Petal.Length    0.409    0.0189     21.6  1.04e- 47
#3 (Intercept)     3.31     0.0621     53.3  1.84e- 98
#4 Petal.Width    -0.209    0.0437     -4.79 4.07e-  6

## we can easily compare the two models


