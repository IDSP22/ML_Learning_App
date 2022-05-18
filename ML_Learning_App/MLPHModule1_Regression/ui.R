### Load packages
require(pacman)
pacman::p_load(
  shiny,
  shinyFeedback,
  shinyWidgets,
  shinyalert,
  tidyverse,
  ggplot2,
  magrittr,
  shinyjs,
  gt,
  waiter,
  bslib,
  sass,
  curl,
  sortable,
  markdown,
  knitr,
  DT,
  RColorBrewer,
  learnr
)
source("helper.R")
source("variableFlowChart.R")

### Define UIs for each step separately

#### Brief intro page ####

intro <- tabPanel(
  value = "intro",
  title = "Welcome!",
  
  # Markdown text chunk
  includeMarkdown(here::here('markdowns/Definitions/intro.md')),
  
  includeMarkdown(here::here('markdowns/Definitions/RSS and TSS.md')),
  
  # Start button
  div(
    style = "display:inline-block; float:right;",
    actionButton("start", "Start",
                 style = "background-color: #0b5b67; border-color: transparent")
  )
)

#### Simple Linear Regression ####

SimpleLRdef <- tabPanel(
  value = "SimpleLRdef",
  title = "Definition of Simple Linear Regression",

  # Definition
  includeMarkdown(here::here('markdowns/Definitions/Definition_Simple_Linear_Regression.md')),


  br(),

  # Interpretation
  includeMarkdown(here::here('markdowns/Interpretation/Linear_regression.md')),

  # Quiz
  
  fluidRow(column(
    12,
    htmlOutput("simplelrquiz")
  )
  ),

  # Action button to move to the next step
  fluidRow(column(
    12,
    # Button to move to the previous/next step
    div(
      style = "display:inline-block; ",
      actionButton("start", "Previous",
                   style = "background-color: #EFb758; border-color: transparent"),
      actionButton("SimpleLRSim", "Next",
                   style = "background-color: #0b5b67; border-color: transparent"),
      style = "display:center-align;"
    ),
    align = "right"
  ))
  )

MultipleLRdef <- tabPanel(
  value = "MultipleLRdef",
  title = "Definition of Multiple Linear Regression",
  
  # Definition
  includeMarkdown(here::here('markdowns/Definitions/Mutliple Regression.md')),
  
  
  br(),
  
  # Interpretation
  includeMarkdown(here::here('markdowns/Interpretation/MultipleLinearregression.md')),
  
  # Quiz
  
  fluidRow(column(
    12,
    htmlOutput("multiplelrquiz")
  )
  ),
  
  # Action button to move to the next step
  fluidRow(column(
    12,
    # Button to move to the previous/next step
    div(
      style = "display:inline-block; ",
      actionButton("SimpleLRSim", "Previous",
                   style = "background-color: #EFb758; border-color: transparent"),
      actionButton("QualPred", "Next",
                   style = "background-color: #0b5b67; border-color: transparent"),
      style = "display:center-align;"
    ),
    align = "right"
  ))
)

  
QualPred <- tabPanel(
      
      value = "QualPred",
      title = "Qualitative Predictors",
      div(style = "text-align: center;", variableFlowChart),
             
    
    # fluidRow(column,
    #          12,
    #            HTML(".bucket-list-container {min-height: 350px;}")
    # ),
    # 
    
    fluidRow(
      column(
        tags$b("Exercise"),
        width = 12,
        bucket_list(
          header = "Drag the items into the buckets they belong to",
          group_name = "bucket_list_group",
          orientation = "horizontal",
          add_rank_list(
            text = "Classification (Scenarios)",
            labels = list(
              "a person arrives at the emergency room with a set of symptoms that could possibly be attributed to one of three medical conditions",
              "an online banking service must be able to determine whether or not a transaction being performed on the site is fradulent, on the basis of the user's IP address, past transaction history, and so forth ",
              "on the basis of DNA sequence data, a biologist would like to figure out which DNA mutations are deleterious and which are not"
              
            ),
            input_id = "rank_list_1"
          ),
          add_rank_list(
            text = "Nominal Variables",
            labels = NULL,
            input_id = "rank_list_2"
          ),
          add_rank_list(
            text = "Ordinal Variables",
            labels = NULL,
            input_id = "rank_list_3"
          )
        )
      )
    ),
  # Action button to move to the next step
  fluidRow(column(
    12,
    # Button to move to the previous/next step
    div(
      style = "display:inline-block; ",
      actionButton("MultipleLRdef", "Previous",
                   style = "background-color: #EFb758; border-color: transparent"),
      actionButton("KNNdef", "Next",
                   style = "background-color: #0b5b67; border-color: transparent"),
      style = "display:center-align;"
    ),
    align = "right"
  ))
) 



KNNdef <- tabPanel(
  
  value = "KNNdef",
  title = "K-Nearest Neighbors for Regression",
  
  fluidRow(column(
    12,
    sliderInput("k", label = "Number of k:",
                min = 1, max = 121, value = 1, step = 10)
  )),
  
  fluidRow(column(
    12,
    plotOutput("KNNplot")
  )),
  
  br(),
  
  # Interpretation
  includeMarkdown(here::here('markdowns/Interpretation/KNNinterpretation.md')),
  
)



### Compile each step to one tab sets
tab_steps <- navlistPanel(id = "steps",
                          intro,
                          SimpleLRdef,
                          MultipleLRdef,
                          QualPred,
                          KNNdef
)


### Define UI for application
shinyUI(
  fluidPage(
    # Application title
    titlePanel("MLPH Module 1"),
    h4("Guided learning lab"),
    
    HTML("<p>Yuyu (Ruby) Chen & Dakota Fan & Yuchen Jiang</p>"),
    
    # Change theme
    theme = theme_ks,
    
    tags$head(tags$style(
      # Set the color for validate() messages and tab color
      HTML(
        "
              .shiny-output-error-validation {
                color: #C34129;
              }
              .well {
                background-color: #F0E6D7;
                border-color: transparent;
                font-weight: bold;
              }
              "
      )
      
    )),
    
    
    # Set to use shinyjs
    shinyjs::useShinyjs(),
    shinyFeedback::useShinyFeedback(),
    
    # Sidebar with step-by-step instructions
    tab_steps
  )
)