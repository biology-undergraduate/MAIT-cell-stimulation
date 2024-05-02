boxplot <- function(data,a,b,xLab,yLab) {
  
  data %>%
    ggplot(aes(x = a,y = b)) +
    geom_boxplot(aes(colour = a),width = 0.4,show.legend = FALSE)+
    geom_jitter(aes(),alpha = 0.4,show.legend = FALSE,position = position_jitter(width = 0.15, seed = 0)) +
    scale_x_discrete(labels = labs) +
    labs(x = xLab,y = yLab)+
    theme_bw()
  
}
