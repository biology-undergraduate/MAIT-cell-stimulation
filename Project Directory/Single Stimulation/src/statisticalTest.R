setwd("~/University/Fourth Year/Project Directory/Single Stimulation")

source("functions/libraryLoader.R")
source("functions/summary.R")
source("functions/outlier.R")
source("functions/normality.R")
source("functions/statTest.R")
source("functions/posthoc.R")
source("functions/boxplot.R")

libs <- c("rstatix","dplyr","tidyverse","ggpubr")

library_loader(libs)

rawData <- read.csv("rawData/Combined Results.csv")

data <- rawData %>%
  subset(select = c(Stimulation,Sample_ID,CD8.MAIT.cell.gMFI))

data <- data %>%
  convert_as_factor(Stimulation,Sample_ID)

summarised <- summary(data)
summarised

outliers <-outlier(data)
outliers

normality <- normality(data)
normality

qqplot <- ggqqplot(data, "CD8.MAIT.cell.gMFI", facet.by = "Stimulation")+
  labs(title = "Figure 1. QQPlot of sample CD69 gMFI")
qqplot
ggsave("figures/qqplot.png")

stats <- test(data)
get_anova_table(stats)

pwc <- posthoc(data)
pwc

pwc <- pwc %>%
  add_xy_position(x = "Stimulation")

bxp <- ggboxplot(data, x = "Stimulation", y = "CD8.MAIT.cell.gMFI", add = "point", xlab = "Condtion", ylab = "CD69 Geometric Mean Fluorescent Intensity")

finalPlot <- bxp +
  stat_pvalue_manual(pwc) +
  labs(
    title = "Figure 2. Comparison of CD69 Upgregulation in CD8 MAIT cells.",
    subtitle = get_test_label(stats, detailed = TRUE),
    caption = get_pwc_label(pwc) 
  ) 

finalPlot

ggsave("figures/Final Plot.png")
