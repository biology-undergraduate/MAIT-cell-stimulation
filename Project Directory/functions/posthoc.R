posthoc <- function(data) {
  
  data %>%
    pairwise_t_test(
      CD8.MAIT.cell.gMFI ~ Stimulation, paired = TRUE,
      p.adjust.method = "bonferroni"
    )
  
}