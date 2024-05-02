setwd("~/University/Fourth Year/Project Directory/Co-Stimulation")

source("functions/libraryLoader.R")

libs <- c("rlang","ggplot2","janitor","dplyr","ragg","svglite","ggfortify","multcomp","ggpubr")

library_loader(libs)

data <- read.csv("rawData/Combined Results.csv")

grouped_data <- data %>%
  group_by(Stimulation)

write.csv(grouped_data,"processedData/groupedData.csv")
