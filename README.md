atomize
=======



[![Build Status](https://travis-ci.org/ropenscilabs/atomize.svg?branch=master)](https://travis-ci.org/ropenscilabs/atomize)


```r
devtools::install_github("ropenscilabs/atomize")
```


```r
library("atomize")
```

atomize fxns into separate package


```r
atomizer(path_ref = "../rredlist", path_new = "../foobar", funcs = "rl_citation")
```

install


```r
devtools::install("../foobar")
```

load


```r
library("foobar")
```

call function


```r
foobar::rl_citation()
#> [1] "IUCN 2015. IUCN Red List of Threatened Species. Version 2015-4 <www.iucnredlist.org>"
```

boom! atomized
