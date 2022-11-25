
# some data cleaning on the original 'messy' data set
# to create an easy, clean data set to work with
gapminder <- read_csv("data/gapminder2010_socioeconomic.csv")
gapminder %>% 
  mutate(life_expectancy_female = as.numeric(life_expectancy_female)) %>% 
  mutate(life_expectancy_male = replace(life_expectancy_male, which(life_expectancy_male == -999), NA)) %>% 
  mutate(main_religion = str_to_lower(main_religion),
         main_religion = str_squish(main_religion)) %>%
  drop_na() %>% 
  write_csv(file = "data/gapminder_clean.csv")
