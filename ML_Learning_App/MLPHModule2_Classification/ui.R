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

### Define UIs for each step separately

#### Brief intro page ####

intro <- tabPanel(
    value = "intro",
    title = "Welcome!",
    
    # Markdown text chunk
    includeMarkdown(here::here('markdowns/Definitions/intro2.md')),
    
    # Markdown text chunk
    includeMarkdown(here::here('markdowns/Definitions/classfication.md')),
    
    # Start button
    div(
        style = "display:inline-block; float:right;",
        actionButton("start", "Start",
                     style = "background-color: #0b5b67; border-color: transparent")
    )
)

#### Logistics Regression ####

logregdef <- tabPanel(
    value = "logregdef",
    title = "Definition of Logistic Regression",
    
    # Definition
    includeMarkdown(here::here('markdowns/Definitions/logistic regression.md')),
    
    
    br(),
    
    # Definition
    includeMarkdown(here::here('markdowns/Definitions/multiple logistic regression.md')),
    br(),
    
    
    # Quiz
    
    fluidRow(column(
        12,
        htmlOutput("logregquiz")
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
            actionButton("logregsim", "Next",
                         style = "background-color: #0b5b67; border-color: transparent"),
            style = "display:center-align;"
        ),
        align = "right"
    ))
)

fig.width <- 600
fig.height <- 450

logregsim <- tabPanel(
    
    
    value = "logregsim",
    title = "Simulation of Logistic Regression",
    
    fluidRow(column(
        12,
        div(p("Try to find values for the slope and intercept that maximize the likelihood of the data.")),
        div(
            
            sliderInput("intercept",
                        strong("Intercept"),
                        min=-3, max=3, step=.25,
                        value=sample(seq(-3, 3, .25), 1), ticks=FALSE),
            br(),
            sliderInput("slope", 
                        strong("Slope"),
                        min=-3, max=3, step=.25, 
                        value=sample(seq(-2, 2, .25), 1), ticks=FALSE),
            br(),
            checkboxInput("logit",
                          strong("Plot in logit domain"),
                          value=FALSE),
            br(),
            checkboxInput("summary",
                          strong("Show summary(glm(y ~ x))"),
                          value=FALSE)
            
        )),
        
        fluidRow(column(
            12,
            plotOutput("reg.plot", width=fig.width, height=fig.height),
            plotOutput("like.plot", width=fig.width, height=fig.height / 3),
            div(class="span7", conditionalPanel("input.summary == true",
                                                p(strong("GLM Summary")),
                                                verbatimTextOutput("summary")))
        ))
    ),
    
    br(),
    
    
    # Action button to move to the next step
    fluidRow(column(
        12,
        # Button to move to the previous/next step
        div(
            style = "display:inline-block; ",
            actionButton("logregdef", "Previous",
                         style = "background-color: #EFb758; border-color: transparent"),
            actionButton("ldadefdef", "Next",
                         style = "background-color: #0b5b67; border-color: transparent"),
            style = "display:center-align;"
        ),
        align = "right"
    ))
)

ldadef <- tabPanel(
    
    value = "ldadef",
    title = "Definition of LDA",
    
    # Definition
    includeMarkdown(here::here('markdowns/Definitions/LDA.md')),
    
    
    br(),
    
    # Action button to move to the next step
    fluidRow(column(
        12,
        # Button to move to the previous/next step
        div(
            style = "display:inline-block; ",
            actionButton("start", "Previous",
                         style = "background-color: #EFb758; border-color: transparent"),
            actionButton("logregsim", "Next",
                         style = "background-color: #0b5b67; border-color: transparent"),
            style = "display:center-align;"
        ),
        align = "right"
    ))
    
)

qdadef <- tabPanel(
    
    value = "qdadef",
    title = "Definition of QDA",
    
    # Definition
    includeMarkdown(here::here('markdowns/Definitions/QDA.md')),
    
    
    br(),
    
    # Definition
    includeMarkdown(here::here('markdowns/Definitions/QDA.md')),
    br(),
    
    
    # Quiz
    
    fluidRow(column(
        12,
        htmlOutput("ldaqdaquiz")
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
            actionButton("logregsim", "Next",
                         style = "background-color: #0b5b67; border-color: transparent"),
            style = "display:center-align;"
        ),
        align = "right"
    ))
    
)
### Compile each step to one tab sets
tab_steps <- navlistPanel(id = "steps",
                          intro,
                          logregdef,
                          logregsim,
                          ldadef,
                          qdadef
)


### Define UI for application
shinyUI(
    fluidPage(
        # Application title
        titlePanel("MLPH Module 2"),
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