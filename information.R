library(dplyr)

data <- read.csv("us-prison-jail-rates-1990.csv", stringsAsFactors = FALSE)


#Overall, how much has the black prison population rate increased?
black_prison_pop_increase <- data %>%
  summarize(increase = max(black_prison_pop_rate, na.rm = TRUE) - min(black_prison_pop_rate, na.rm = TRUE))

print(black_prison_pop_increase)

#Overall, how much has the white prison population rate increased?
white_prison_pop_increase <- data %>%
  summarize(increase = max(white_prison_pop_rate, na.rm = TRUE) - min(white_prison_pop_rate, na.rm = TRUE))

print(white_prison_pop_increase)

#Which state has the largest black prison population rate?
largest_black_prison_pop_state <- df %>%
  group_by(state) %>%
  summarize(max_black_prison_rate = max(black_prison_pop_rate, na.rm = TRUE)) %>%
  filter(max_black_prison_rate == max(max_black_prison_rate, na.rm = TRUE))

print(largest_black_prison_pop_state)

#Which state has the largest white prison population rate?
largest_white_prison_pop_state <- data %>%
  group_by(state) %>%
  summarize(max_white_prison_rate = max(white_prison_pop_rate, na.rm = TRUE)) %>%
  filter(max_white_prison_rate == max(max_white_prison_rate, na.rm = TRUE))

print(largest_white_prison_pop_state)

#what is the average prison population rate change from 1990 to 2018? 
average_prison_pop_rate_1990 <- data %>%
  filter(year == 1990) %>%
  summarize(average_rate = mean(total_prison_pop_rate, na.rm = TRUE))
print(average_prison_pop_rate_1990)

average_prison_pop_rate_2000 <- data %>%
  filter(year == 2000) %>%
  summarize(average_rate = mean(total_prison_pop_rate, na.rm = TRUE))
print(average_prison_pop_rate_2000)
rate_difference <- average_prison_pop_rate_2000 - average_prison_pop_rate_1990

print(rate_difference)

