library(ggplot2)
library(dplyr)

data <- read.csv("us-prison-jail-rates-1990.csv", stringsAsFactors = FALSE)

data_long <- data %>%
  select(black_prison_pop_rate, white_prison_pop_rate, native_prison_pop_rate, aapi_prison_pop_rate, latinx_prison_pop_rate)

data_long <- data.frame(
  Race = rep(c("black", "white", "native", "aapi", "latinx"), each = nrow(data_long)),
  Rate = c(data_long$black_prison_pop_rate, data_long$white_prison_pop_rate, data_long$native_prison_pop_rate, data_long$aapi_prison_pop_rate, data_long$latinx_prison_pop_rate)
)

ggplot(data_long, aes(x = Race, y = Rate)) +
  geom_bar(stat = "identity") +
  labs(x = "Race", y = "Rate Percent", title = "Prison Population Rate by Race") +
  theme_minimal()

