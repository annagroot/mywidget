rm(list = ls())

# devtools::install_github("jjallaire/sigma")
devtools::install_github("annagroot/mywidget")

library(htmlwidgets)
##Test
# library(sigma)
# data <- system.file("examples/ediaspora.gexf.xml", package = "sigma")
# sigma(data)
## End test


# devtools::create("mywidget")               # create package using devtools
# htmlwidgets::scaffoldWidget("mywidget")    # create widget scaffolding
# devtools::document()                       # roxygenize, so NAMESPACE is updated
# devtools::install()                        # install the package so we can try it

library(mywidget)
mywidget("Hello, genius!")                   # test the widget

mywidget


data <- data.frame(a=c('vist','order','paid'), b=c(116634,2007,435))

mywidget(data)
