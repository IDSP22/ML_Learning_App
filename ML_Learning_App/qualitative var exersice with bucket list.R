## qualitative variables exercise with bucket list

library(shiny)
library(sortable)


ui <- fluidPage(
  
  tabPanel(value = 'pg1', 
           # define the data load page
           title = 'Overview',
         
           div(
             style = "text-align: center;",
             variableFlowChart
           ),
           
           ),
           
  tags$head(
    tags$style(HTML(".bucket-list-container {min-height: 350px;}"))
  ),
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
  )

)

server <- function(input,output) {
  output$results_1 <-
    renderPrint(
      input$rank_list_1 # This matches the input_id of the first rank list
    )
  output$results_2 <-
    renderPrint(
      input$rank_list_2 # This matches the input_id of the second rank list
    )
  output$results_3 <-
    renderPrint(
      input$bucket_list_group # Matches the group_name of the bucket list
    )
}


shinyApp(ui, server)