### Load packages
require(pacman)
pacman::p_load(shiny,
               shinyFeedback,
               shinyWidgets,
               shinyalert,
               tidyverse,
               ggplot2,
               magrittr,
               shinyjs,
               gt,
               gtsummary, 
               waiter,
               sortable, 
               caret, 
               boot,
               DT, 
               RColorBrewer,
               learnr)
# Define Server Logic

shinyServer(function(input, output){
    
    #### learnR html####
    
    # rsconnect::deployApp('/Users/yuyuchen/Documents/GitHub/ML_Learning_App/ML_Learning_App/markdowns/Quiz/simpleLRquiz.Rmd')
    
    output$simplelrquiz <- renderUI({
        tags$iframe(
            src="https://rubychan299.shinyapps.io/simplelrquiz/"
        )
    })
    
    output$multiplelrquiz <- renderUI({
        tags$iframe(
            src=" https://rubychan299.shinyapps.io/multiplelrquiz/"
        )
    })

    
    #### Qulativative Predictors ####
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
    
    #### KNN ####
    
    mytheme <- theme(axis.title = element_text(size = 30),
                     axis.text = element_text(size = 20))
    x <- seq(from = -6, to = 6, by = 0.1)
    n <- length(x)
    y_true <- sin(x)    #true function
    y <- y_true + rnorm(length(x))
    train_dat <- data.frame(x = x, y = y, y_true = y_true)
    
    
    output$KNNplot <- renderPlot({
        
        
        x_test <- seq(from = -6, to = 6, by = 0.01)  #test data
        y_true_test <- sin(x_test)
        y_test <- y_true_test + rnorm(length(x_test))
        pred_dat <- NULL
        test_error_seq <- train_error_seq <- rep(0, 3)
        fit <- knnreg(data.frame(x), y, k = input$k)
        y_test_hat <- predict(fit, data.frame(x_test))
        test_error <- sum((y_test - y_test_hat)^2)
        y_train_hat <- predict(fit, data.frame(x))
        train_error <- sum((y - y_train_hat)^2)
        pred_dat <- rbind(pred_dat,
                          data.frame(x = x_test,
                                     y = y_test_hat,
                                     y_true = y_test,
                                     k = input$k))
        text <- paste(c("K =", input$k, "Train Error:", train_error, "Test Error", test_error), collapse = " ") 
        
        ggplot(pred_dat) + 
            geom_point(mapping = aes(x = x,
                                     y = y),
                       data = train_dat,
                       alpha = 0.5,
                       color = "black") +
            
            geom_point(mapping = aes(x = x, 
                                     y = y,
                                     color = factor(input$k)))+
            geom_line(mapping = aes(x = x,
                                    y = y_true),
                      data = train_dat,
                      size = 2) + annotate ("text", x = 0, y = -2.5,
                                            label = text,
                                            size = 5,
                      )
        
        
        
        
    })
    
    
    #### From here to the end is the step controls ####
    
    # intro to SimpleLR
    observeEvent(input$start, {
        req(input$`start`)
        updateTabsetPanel(inputId = "steps", selected = "SimpleLRdef")
    })
    
    observeEvent(input$SimpleLRdef, {
        req(input$`SimpleLRdef`)
        updateTabsetPanel(inputId = "steps", selected = "SimpleLRSim")
    })
    
    observeEvent(input$SimpleLRSim, {
        req(input$`SimpleLRSim`)
        updateTabsetPanel(inputId = "steps", selected = "MultipleLRdef")
    })
    
    observeEvent(input$MultipleLRdef, {
        req(input$`MultipleLRdef`)
        updateTabsetPanel(inputId = "steps", selected = "QualPred")
    })
})