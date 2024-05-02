test <- function(data,sample) {
  
  data <-data %>%
    arrange(desc(Stimulation))
  
  data$id <- rep(1:sample, 24)
  
  res.aov <-data %>%
    anova_test(CD8.MAIT.cell.gMFI ~ Stimulation + Error(id/Stimulation))
  
}

# Rep (x, 24) X is 1:sampleSize)