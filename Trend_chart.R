library(ggplot2)
library(dplyr)

data <- read.csv("us-prison-jail-rates-1990.csv", stringsAsFactors = FALSE)

selected_states <- c("CA", "TX", "NY", "FL", "IL")

filtered_data <- data %>%
  filter(state %in% selected_states)

state_year_data <- filtered_data %>%
  group_by(state, year) %>%
  summarize(avg_prison_rate = mean(total_prison_pop_rate, na.rm = TRUE))

ggplot(state_year_data, aes(x = year, y = avg_prison_rate, color = state, group = state)) +
  geom_line() +
  labs(title = "Trends of Average Prison Population Rate Over Time",
       x = "Year",
       y = "Average Prison Population Rate",
       color = "State") +
  theme_minimal()+
  theme(axis.text = element_blank(),
  axis.title = element_blank(),
  panel.grid = element_blank())

