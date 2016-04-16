<!-- README.md is generated from README.Rmd. Please edit that file -->
RStudio addins manager
======================

[![Build Status](https://travis-ci.org/csgillespie/addinmanager.png?branch=master)](https://travis-ci.org/csgillespie/addinmanager) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/addinmanager)](https://cran.r-project.org/package=addinmanager)

RStudio addins let you execute a bit of R code or a Shiny app through the RStudio IDE, either via the Addins dropdown menu or with a keyboard shortcut. This package is an RStudio addin for managing **other** addins. To run these addins, you need the latest version of [RStudio](https://www.rstudio.com/).

Installation
------------

The package can be installed via `devtools`

``` r
## Need the latest version of DT as well
devtools::install_github('rstudio/DT')
devtools::install_github("csgillespie/addinmanager")
```

You can test the package at the command line with

``` r
addinmanager::addin_manager()
```

Running addins
--------------

After installing the package, the *Addins* menu toolbar will be populated with a new addin called **Addin Manager**. When you lauch this addin, a DT table will be launched:

![Screenshot](https://raw.github.com/csgillespie/addinmanager/master/images/screenshot.png)

In the screenshot above, the highlighted addins, `shinyjs` and `ggThemeAssit`, indicate that this addins have already installed.

When you click **Done**

-   Highlighted addins will be installed.
-   Un-highlighted addins will be removed.

Simple!

Including your addin
--------------------

Just fork and alter [raddins.md](https://github.com/csgillespie/addinmanager/tree/master/inst/extdata/raddins.md) which is located in the `inst/extdata` directory. This file is a md file with three columns:

-   addin Name/title
-   Brief Description
-   Package. If the package is only on github, use name/repo.

The initial list of addins was obtain from [daattali](https://github.com/daattali/rstudio-addins) repo.

Current List of Addins
----------------------

|     | Name                    | Description                                                                                          | Package                            |
|-----|:------------------------|:-----------------------------------------------------------------------------------------------------|:-----------------------------------|
| 2   | ggplot2 Marginal Plots  | Add marginal plots to ggplot2                                                                        | ggExtra                            |
| 3   | ggplot Theme Assist     | Customize your ggplot theme                                                                          | ggThemeAssist                      |
| 4   | Data Recoding           | Interactively generate R code for variable manipulation (levels editing / levels ordering / cutting) | questionr                          |
| 5   | Colour Picker           | Lets you easily select colours                                                                       | shinyjs                            |
| 6   | Roxygen2 comments       | Add/remove roxygen2 comments                                                                         | csgillespie/roxygen2               |
| 7   | Schedule Rscripts       | Easily scheduling Rscripts                                                                           | jwijffels/taskscheduleR            |
| 8   | Assign Default Values   | Set function arguments in selection to their default values                                          | jennybc/jadd                       |
| 9   | Wrap Rmd                | Wrap selected R Markdown text but don't insert lines breaks into inline R code                       | tjmahr/WrapRmd                     |
| 10  | Tidy Data               | Interactively build tidyr function call (gather)                                                     | MangoTheCat/tidyshiny              |
| 11  | Lattice Plotting        | Interactively build plots using the `lattice` system                                                 | homerhanumat/addinplots            |
| 12  | Copy Frame to Clipboard | Copy a `data.frame` to the clipboard                                                                 | BAAQMD/copydat                     |
| 13  | Render Rmd in Console   | Render an R Markdown document in the global environment                                              | jeffjjohnston/RStudioConsoleRender |
| 14  | Document This           | Auto-generate Roxygen skeletons for functions and data                                               | mdlincoln/docthis                  |
| 15  | Hist Add-In             | Interactively create histograms with ggplot2 and obtain the R Code                                   | Stan125/limoaddin                  |
| 16  | Graphical Unit Testing  | Visual regression testing and graphical diffing with testthat                                        | lionel-/vdiffr                     |

Other information
-----------------

-   If you have any suggestions or find bugs, please use the github [issue tracker](https://github.com/csgillespie/addmanager/issues).
-   Feel free to submit pull requests.
-   TODO: Make the package name a url in the table.
