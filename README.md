Rworkpath
==============
[![CircleCI](https://circleci.com/gh/dataatelier/Rworkpath.svg?style=svg)](https://circleci.com/gh/dataatelier/Rworkpath)

R client to Workpath platform API

## Description

This package allows you to interact with the [Workpath](https://www.workpath.com/) [API](https://developer.workpath.com/).


## What is Inside?

The following functions are implemented:

  - `get_workpath_data`: Query Workpath API
  - `utils`: Configuration utility functions

### Stable Version

```{r, eval=FALSE}
# install package from CRAN
install.packages("Rworkpath")
# load package
library(Rworkpath)
```

### Current Development Version

```{r, eval=FALSE}
# install devtools package if it's not already
if (!requireNamespace("devtools", quietly = TRUE)) {
install.packages("devtools")
}
# install package from GitHub
devtools::install_github("dataatelier/Rworkpath")
# load package
library(Rworkpath)
```
