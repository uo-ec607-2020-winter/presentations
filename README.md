# Student presentations

Please push your presentations to this repo as separate sub-directories, indicating the order that you presented, your name, and a v. brief description, all separated by dashes. E.g.: `01-FirstnameLastname-Topic/`.

## R Markdown

Please try to make your presentations using [R Markdown](https://rmarkdown.rstudio.com/). You can use any one of the multiple slide deck options. (For what it's worth, I use the [xaringan package with metropolis theme](https://github.com/yihui/xaringan/wiki/Themes) for my lecture slides). Or you can output as a [GitHub document](https://rmarkdown.rstudio.com/github_document_format.html) or [HTML document](https://bookdown.org/yihui/rmarkdown/html-document.html). If you choose the latter, I would request that you please include `keep_md: true` in your YAML, so that it is readable directly on GitHub.

## Topics

Topics will be allocated on a first-come-first-served basis. Each person is expected to present twice. Please add your name to the table below (you can [edit this README](https://help.github.com/articles/editing-files-in-your-repository/) directly on GitHub) as soon as you have chosen. Note, however, that "open" presentation topics need to be approved first. I've given a list of suggested ideas towards the bottom of this page. I would also prefer that some topics are only presented after specific lectures, but we can discuss that after you chosen.

| Lecture | Topic | Resources | Presenter |
|---------|-------|-----------|-----------|
| 1 | None | NA | NA | 
| 2 | R Markdown | [a](https://rmarkdown.rstudio.com/), [b](https://bookdown.org/yihui/rmarkdown/) | [Kevin Song](https://raw.githack.com/uo-ec607-2020-winter/presentations/master/01-KevinSong-RMarkdown/rmarkdown-intro.html#1) | 
| 3 | GitKraken (or other GUI) | [a](https://www.gitkraken.com/), [b](https://www.sourcetreeapp.com/), [c](https://desktop.github.com/), [d](https://github.atom.io/), [e](https://code.visualstudio.com/docs/introvideos/versioncontrol) | [Shan Zhang](https://raw.githack.com/uo-ec607-2020-winter/presentations/master/02-ShanZhang-Gitkraken/Gitkraken.html#1)|
| 4 |  |  |  |
| 5 | Tidy data | [a](https://vita.had.co.nz/papers/tidy-data.pdf)  | [SM Shihab Siddiqui](https://raw.githack.com/uo-ec607-2020-winter/presentations/master/03-SMShihabSiddiqui-TidyData/Presentation.html) | 
| 6 | data.table | [a](http://rdatatable.gitlab.io/data.table/index.html), [b](https://dtplyr.tidyverse.org/), [c](https://atrebas.github.io/post/2019-03-03-datatable-dplyr/) | [Robert McDonough](https://raw.githack.com/uo-ec607-2020-winter/presentations/master/04-RobertMcDonough-datatable/Data.Table_Presentation.html) | 
|   | SelectorGadget | [a](https://cran.r-project.org/web/packages/rvest/vignettes/selectorgadget.html) | [Promise Kamanga](https://raw.githack.com/uo-ec607-2020-winter/presentations/master/05-PromiseKamanga-SelectorGadget/SelectorGadget_Slides.html) | 
| 7 | APIs | [a](https://zapier.com/learn/apis/) | [Garrett Stanford](https://raw.githack.com/uo-ec607-2020-winter/presentations/master/06-GarrettStanford-APIs/API.html) | 
| 8 | Regular expressions | [a](http://stat545.com/block022_regular-expression.html), [b](https://www.garrickadenbuie.com/project/regexplain/), [c](https://www.rstudio.com/wp-content/uploads/2016/09/RegExCheatsheet.pdf) | [Colleen O'Briant](https://raw.githack.com/uo-ec607-2020-winter/regexpresentation/master/regexPresenation.html#1) | 
| 9 | CRS | [a](https://geocompr.robinlovelace.net/spatial-class.html#crs-intro), [b](https://www.nceas.ucsb.edu/~frazier/RSpatialGuides/OverviewCoordinateReferenceSystems.pdf) | [SM Shihab Siddiqui](https://raw.githack.com/uo-ec607-2020-winter/presentations/master/08-SMShihabSiddiqui-CRS/Presentation2.html) | 
| 10 | rtweet | [a](https://rtweet.info/) | [Brad Bailey](https://github.com/uo-ec607-2020-winter/presentations/blob/master/09-BradBailey-rtweet/08-BradBailey-rtweet.pdf)| 
| 11 | Tidyeval | [a](https://dplyr.tidyverse.org/articles/programming.html), [b](https://tidyeval.tidyverse.org/) | [Ethan Holdahl](https://raw.githack.com/uo-ec607-2020-winter/presentations/master/10-EthanHoldahl-Tidyeval/Tidyeval.html)| 
| 12 |  |  |  |
| 13 | conda |  | James |  
|    | reticulate |  | Chris | 
| 14 | Shiny |  | Ethan Holdahl |
|    | Writing an R package |  | Robert McDonough | 
| 15 | tsibble and/or fable |  | Kevin Song | 
|    | prophet |  | promise | 
| 16 |geocode  |  | Garrett Stanford | 
|    | julia |  | Pramod | 
| 17 |  tidytext |  | Colleen O'Briant | 
|    | blogdown | [a](https://bookdown.org/yihui/blogdown/) | Brad Bailey | 
| 18 | Spark | [a](https://therinspark.com/intro.html#intro-background), [b](https://en.wikipedia.org/wiki/Apache_Spark) | Jake Schefrin | 
|    | bayesian |  | shan | 
| 19 | Big data | [a](https://www.aeaweb.org/articles?id=10.1257/jep.28.2.3), [b](https://www.aeaweb.org/articles?id=10.1257/aer.p20151023), [c](https://www.aeaweb.org/articles?id=10.1257/jep.31.2.87)  | Chris Berg | 
|    | Cross-validation |  | Jake Schefrin | 
| 20 | drake |  | Pramod Dudhe | 
|    | rcpp |  | James | 

### Open topic and package suggestions

Don't feel limited to these, but here are some suggestions for the open topic slots:

#### C++
- [Rcpp](http://dirk.eddelbuettel.com/code/rcpp.html) (Note: You may want to start with a gentler introduction like [this](https://csgillespie.github.io/efficientR/performance.html#rcpp) or [this](https://adv-r.hadley.nz/rcpp.html))

#### Communication
- [Shiny](https://shiny.rstudio.com
#### Bayesian
- [greta](https://greta-stats.org/)
- [rstan](https://github.com/stan-dev/rstan/wiki/RStan-Getting-Started) or derivatives ([brms](https://paul-buerkner.github.io/brms/), [rstanarm](http://mc-stan.org/rstanarm/), etc.)

#### Time-series and forecasting
- [prophet](https://facebook.github.io/prophet/)
- [tsibble](https://tsibble.tidyverts.org/) and/or [fable](https://fable.tidyverts.org/)
- [zoo](https://cran.r-project.org/web/packages/zoo/index.html)

#### Julia
- [RCall](http://juliainterop.github.io/RCall.jl/stable/index.html) and/or [JuliaCall](https://non-contradiction.github.io/JuliaCall/index.html)

#### Python
- [Conda](https://conda.io/docs/) and/or [Jupyter Notebooks](https://jupyter.org/)
- [Reticulate](https://rstudio.github.io/reticulate/)

#### Social and networks
- [ggraph](https://ggraph.data-imaginist.com/) and [tidygraph](https://tidygraph.data-imaginist.com/)

- [wikipediatrend](https://github.com/petermeissner/wikipediatrend/)

#### Text / NLP
- [tidytext](https://juliasilge.github.io/tidytext/)

#### Workflow and automation
- [drake](https://ropensci.github.io/drake/)
- [workflowr](https://jdblischak.github.io/workflowr/)
