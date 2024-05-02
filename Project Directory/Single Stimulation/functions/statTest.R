test <- function(data) {
  
  data <-data %>%
    arrange(desc(Stimulation))
  
  data$id <- rep(1:9, 4)
  
  res.aov <-data %>%
    anova_test(CD8.MAIT.cell.gMFI ~ Stimulation + Error(id/Stimulation))
  
}