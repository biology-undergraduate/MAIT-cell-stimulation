setwd("~/University/Fourth Year/Project Directory/Co-Stimulation")

source("functions/libraryLoader.R")
source("functions/boxplot.R")

libs <- c("rlang","ggplot2","janitor","dplyr","ragg","svglite","ggfortify","multcomp","ggpubr")

library_loader(libs)

data <- read.csv("processedData/groupedData.csv")

CD8_gMFI_plot <- boxplot(data,data$Stimulation,data$CD8.MAIT.cell.gMFI,"Stimulation", "CD8 MAIT Cell gMFI")
CD8_gMFI_plot

ggsave("figures/CD8_gMFI_plot.png")
