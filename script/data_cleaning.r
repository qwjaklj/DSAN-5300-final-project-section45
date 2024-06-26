library(readr)
library(dplyr)
data <- read_csv('../data/GamingStudy_data.csv', locale = locale(encoding = 'ISO-8859-1'))
age <- read_csv('../data/age.csv')
data_cleaned <- data %>% select(-highestleague, -Reference, -accept, -League, -streams, -Platform)
unique_games <- unique(data_cleaned$Game)
age$Proportion <- as.numeric(sub("%", "", age$Proportion)) / 100
game_categories <- setNames(seq_along(unique_games), unique_games)
data_cleaned$Game_Category <- as.integer(factor(data_cleaned$Game, levels = names(game_categories)))
write_csv(data_cleaned, 'data_cleaned.csv')
write_csv(age,'age_final.csv')
