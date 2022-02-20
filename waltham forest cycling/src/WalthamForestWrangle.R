# Load packages
# devtools::install_github("glin/reactable")
#remotes::install_github("kcuilla/reactablefmtr", force = TRUE)
pacman::p_load(tidyverse, here, janitor, readxl, httr, reactable, reactablefmtr, htmltools)
#https://kcuilla.github.io/reactablefmtr/articles/themes.html


# Set Parameters

# Load Data
source(here::here("src", "r_functions","getElectionData.R"))
source(here::here("src", "r_functions","outputFunctions.R"))

# https://postcodes.io/
# api.postcodes.io/postcodes?q=B74 4EU
# https://stackoverflow.com/questions/54130094/how-can-i-use-javascript-in-code-chunks-of-rmarkdown
# https://levelup.gitconnected.com/all-possible-ways-of-making-an-api-call-in-plain-javascript-c0dee3c11b8b


htmltools::browsable(
  tagList(
    div(
      div(tags$label("Filter Type", `for` = "party-filter")),
      tags$select(
        id = "party-filter",
        onchange = "Reactable.setFilter('party-filter-table', 'wardParty', this.value)",
        tags$option("All", value = ""),
        lapply(unique(wards$wardParty), tags$option)
      )
    ),
    
    tags$hr("aria-hidden" = "false"),
    
    #reactable(data, defaultPageSize = 5, elementId = "cars-filter-table")
    buildWardTable(wards, elementId = "party-filter-table")
  )
)

