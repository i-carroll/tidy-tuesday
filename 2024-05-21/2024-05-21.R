#packages
library(tidyverse)
library(DataExplorer)

#read in data
emissions <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2024/2024-05-21/emissions.csv')

#look at the data
DataExplorer::create_report(emissions) #need to write html I think

#vis
emissions |>
  group_by(year) |>
  mutate(total_emissions_MtCO2e_year = sum(total_emissions_MtCO2e)) |>
  ungroup() |>
  group_by(year, commodity) |>
  mutate(total_emissions_MtCO2e_year_c = sum(total_emissions_MtCO2e)) |>
  ungroup() |>
  ggplot(aes(x = year, y = total_emissions_MtCO2e_year_c, group = commodity)) +
  geom_line(aes(color = commodity)) +
  geom_line(aes(x = year, y = total_emissions_MtCO2e_year))
