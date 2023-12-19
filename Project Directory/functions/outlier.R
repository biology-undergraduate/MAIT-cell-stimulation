outlier <- function(data) {
  
  data %>%
    group_by(Stimulation) %>%
    identify_outliers(CD8.MAIT.cell.gMFI)
  
}