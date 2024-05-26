library(ggplot2)
library(dplyr)
library(maps)
library(readr)

us_prison_jail_rates_1990 <- read_csv("~/Desktop/infohw4/a4-incarceration-assignment-scarlett0226/us-prison-jail-rates-1990.csv")

state_shape <- map_data("state")

state_prison_data <- us_prison_jail_rates_1990 %>%
  rename(region = state)

state_shape <- state_shape %>%
  left_join(state_prison_data, by = "region")

ggplot(state_shape) +
  geom_polygon(aes(x = long, y = lat, group = group, fill = total_prison_pop_rate)) +
  coord_map() +
  scale_fill_continuous(low = "yellow", high = "red") +
  labs(fill = "Total Prison Population Rate",
       title = "Total Prison Population Rate by State") +
  theme_minimal() +
  theme(axis.text = element_blank(),
        axis.title = element_blank(),
        panel.grid = element_blank())

