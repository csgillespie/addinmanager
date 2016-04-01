get_addins = function() {
  ## Locate file of raddins
  path = system.file("extdata/raddins.csv", package = "addinmanager")
  dd = read.csv(path, stringsAsFactors = FALSE)

  ## Determine which packages are in CRAN.
  ## Assume others are in github
  dd$is_cran = !grepl("/", dd[,3])

  ## For github packages, get package name
  names = unlist(strsplit(dd$Package[!dd$is_cran], "/"))
  ## Remove github user names
  names = names[seq(2, length(names), by=2)]
  #urls = ifelse(dd$is_cran, "https://cran.r-project.org/package=", "https://github.com")

  ## Nice Package name
  dd$full_name = dd$Package
  dd$Package[!dd$is_cran] = names
  dd
}

#' Addin manager
#'
#' Manages addins
#' @importFrom DT renderDataTable dataTableOutput
#' @import miniUI
#' @importFrom shiny observeEvent stopApp paneViewer runGadget
#' @importFrom devtools install_github
#' @export
addin_manager = function() {

  # Our ui will be a simple gadget page, which
  # simply displays the time in a 'UI' output.
  ui = miniPage(
    gadgetTitleBar("RStudio Addins"),
    miniContentPanel(
      DT::dataTableOutput("addins")
    )
  )

  server = function(input, output, session) {
    ## Set DT page length
    options(DT.options = list(pageLength = 10))

    addins = get_addins()

    ## See which packages are already installed to highlight
    install_pack = installed.packages()[,1]
    highlight = rownames(addins[addins[,3] %in% install_pack,])

    ## Total number of pacakges
    all_packages = as.character(1:nrow(addins))

    output$addins = DT::renderDataTable(addins[,1:3], server = FALSE,
                                        selection = list(mode = 'multiple', selected = highlight))

    observeEvent(input$done, {
      ## Packages to install
      rows_selected = input$addins_rows_selected
      ## Don't install packages already installed
      select = rows_selected[!(rows_selected %in% highlight)]
      for(i in select) {
        if(addins$is_cran[i])
          install.packages(addins[i,"full_name"])
        else
          devtools::install_github(addins[i,"full_name"])
      }

      ## Packages to remove
      not_select = all_packages[!(all_packages %in% rows_selected)]
      ## Only remove packages already installed
      not_select = not_select[not_select %in% highlight]
      for(i in not_select)
        remove.packages(addins[i,"Package"])

      stopApp()
    })


  }

  # We'll use a pane viwer, and set the minimum height at
  # 300px
  viewer = paneViewer(300)
  runGadget(ui, server, viewer = viewer)

}

# # 'inst/rstudio/addins.dcf', and you're ready to go!"2016-03-31 23:19:58"