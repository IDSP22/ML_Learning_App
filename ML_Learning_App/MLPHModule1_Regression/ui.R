
source(here::here("helper.R"))

### Define UIs for each step separately

## Brief intro page
intro <- tabPanel(
  value = "intro",
  title = "Welcome!",
  
  # Markdown text chunk
  includeMarkdown(here::here('markdowns/intro.md')),
  
  # Start button
  div(
    style = "display:inline-block; float:right;",
    actionButton("start", "Start",
                 style = "background-color: #0b5b67; border-color: transparent")
  )
)

## Simple Linear Regression
SimpleLR <- tabPanel(
  value = "definition",
  title = "Definition of Simple Linear Regression",
  
  # Definition
  includeMarkdown(here::here('markdowns/Definitions/Definition_Simple_Linear_Regression.md')),
  
  # Visualization
  fluidRow(column(12,
                  
  ),
  
  # Examples
  fluidRow(column(12,
                  
  )
  ),
  
  # R code for analysis/Simualtions
  fluidRow(
    column(12,
           htmlOutput("definition_quiz_res")
    ),
    align = "center"
  ),
  
  br(),
  
  # Interpretation
  includeMarkdown(here::here('markdowns/Interprestation/Linear_regression.md')),
  
  # Quiz
  
  
  # Action button to move to the next step
  fluidRow(column(
    12,
    # Button to move to the previous/next step
    div(
      style = "display:inline-block; ",
      actionButton("1_0", "Previous",
                   style = "background-color: #EFb758; border-color: transparent"),
      actionButton("1_2", "Next",
                   style = "background-color: #0b5b67; border-color: transparent"),
      style = "display:center-align;"
    ),
    align = "right"
  ))
)
