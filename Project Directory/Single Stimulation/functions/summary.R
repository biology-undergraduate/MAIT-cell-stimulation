summary <- function(data) {
  
  data %>%
    group_by(Stimulation) %>%
    get_summary_stats("CD8.MAIT.cell.gMFI", type = "mean_sd")
  
}