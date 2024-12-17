rm(list = ls())

# devtools::install_github("jjallaire/sigma")
detach("package:mywidget", unload = TRUE)
devtools::install_github("annagroot/mywidget")

library(htmlwidgets)
library(mywidget)

####TEST FUNNEL#######

data <- data.frame(a = c('Vist','Order','Paid', 'Shipped', 'Delivered'),
                   b = c(116634,2007,435, 200, 100))

######FUNNEL SETTIGNS#######

label_format <- htmlwidgets::JS("
      function(label, value) {
        return label + ': ' + value + ' hits';
      }
    ") #How the text lables should be formatted

colors_scale <- c('#c30010',
                  '#f01e2c',
                  '#ee6b6e',
                  '#f69697',
                  '#ffcbd1')


options <- list(
  chart = list(
    width = NULL,
    height = NULL,
    bottomPinch = 0.5, #at which level of the funnel should the pinch be visualized,
    curve = list(enabled = TRUE, height = 20)
  ),
  block = list(
    dynamicHeight = FALSE,     # Dynamic Height: Block heights proportional to values.
    highlight     = TRUE,         # Highlight on Hover: Change appearance on hover.
    fill = list(
      type = 'gradient', #or 'solid'     # Gradient: Blocks will have gradient fills.
      scale = colors_scale,
      ratio = 0.5             # Adjust ratio of gradient between colors.
    )
  ),
  label = list(
    fontSize = 12,
    fontFamily = 'Arial',
    fill = '#333333',         # Style Labels: Font color and size.
    # Formatting labels: Append units or modify text as desired.
    format = label_format
  )
)

p <- mywidget(data, options = options)
p

saveWidget(p, file=paste0("vignette_funnel.html"))

