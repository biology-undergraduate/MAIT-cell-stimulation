source("functions/libraryLoader.R")
source("functions/summary.R")
source("functions/outlier.R")
source("functions/normality.R")
source("functions/statTest.R")
source("functions/posthoc.R")
source("functions/boxplot.R")
source("functions/statPlotter.R")

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

qqplot <- ggqqplot(data, "CD8.MAIT.cell.gMFI", facet.by = "Stimulation")
qqplot

stats <- test(data)
get_anova_table(stats)

pwc <- posthoc(data)
pwc

pwc <- pwc %>%
  add_xy_position(x = "Stimulation")

bxp <- ggboxplot(data, x = "Stimulation", y = "CD8.MAIT.cell.gMFI", add = "point")

finalPlot <- bxp +
  stat_pvalue_manual(pwc) +
  labs(
    title = "Comparison of CD69 Upgregulation in CD8 MAIT cells under different cytokine stimulation measures.",
    subtitle = get_test_label(stats, detailed = TRUE),
    caption = get_pwc_label(pwc)
  )

finalPlot

ggsave("figures/Final Plot.png")