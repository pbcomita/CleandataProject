---
title: "Test2"
author: "PComita"
date: "Thursday, November 12, 2015"
output: md_document
---
#Header 1 Test2 

##Header 2 author: "PComita"

###Header 3 date: "Thursday, November 12, 2015"

*italic*   **bold**

_italic_   __bold__

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

```{r}
summary(cars)
```

You can also embed plots, for example:


```{r, echo=FALSE}
plot(cars)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.

```{r, echo=FALSE}
summary(cars$dist)
summary(cars$speed)
```
