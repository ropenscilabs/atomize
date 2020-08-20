atomize
=======



[![Build Status](https://travis-ci.org/sckott/atomize.svg?branch=master)](https://travis-ci.org/sckott/atomize)


```r
devtools::install_github("sckott/atomize")
```


```r
library("atomize")
```

atomize fxns into separate package


```r
download.file("https://cloud.r-project.org/src/contrib/cowsay_0.8.0.tar.gz",
  "cowsay_0.8.0.tar.gz")
untar("cowsay_0.8.0.tar.gz", exdir = tempdir())
path <- file.path(tempdir(), "cowsay")
path2 <- file.path(tempdir(), "goatsay")
atomizer(path_ref = path, path_new = path2, funcs = "say")
```

install


```r
devtools::install(path2)
```

load


```r
library("goatsay")
```

call function


```r
goatsay::say()
```

boom! atomized
