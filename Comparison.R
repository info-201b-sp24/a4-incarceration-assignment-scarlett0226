library(dplyr)
library(ggplot2)

data <- read.csv("Desktop/infohw4/a4-incarceration-assignment-scarlett0226/us-prison-jail-rates-1990.csv")

dataset <- data %>%
  select(black_prison_pop_rate, white_prison_pop_rate, native_prison_pop_rate, aapi_prison_pop_rate, latinx_prison_pop_rate) %>%
  gather(key = "Race", value = "Rate")

ggplot(dataset, aes(x = Race, y = Rate)) +
  geom_bar(stat = "identity") +
  labs(x = "Race", y = "Rate Percent", title = "Prison Population Rate")
