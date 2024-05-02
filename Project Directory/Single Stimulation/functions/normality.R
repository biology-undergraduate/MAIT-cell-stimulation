normality <- function(data) {
  
  data %>%
    group_by(Stimulation) %>%
    shapiro_test(CD8.MAIT.cell.gMFI)
  
}