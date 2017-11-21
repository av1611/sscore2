library(shiny)
shinyUI(fluidPage(
    titlePanel("Credit risk assesment using public datasets"),
    
    fluidRow(
        p('The objective of this project is to assess the credit risk using public credit scoring datasets.
        The datasets were selected such that they contain similar structure and features.
        Using each dataset credit scoring model is created using a random forest.
        Then all the models are combined with the objective to have a better credit risk estimator.')
    ),
    fluidRow(
    column(3,wellPanel(
        h4('Inputs'),
        p('Modify the inputs in order to calculate the credit scorecard, or simply press random
          for the app to pick the inputs of a random  example in the databases.'),
        sliderInput('age', 'Age',value = 40, min = 18, max = 80, step = 0.5,),
        sliderInput('ncredits', 'Number of credits',value = 1, min = 0, max = 10, step = 1,),
        p(' '),
        checkboxInput("credithist", "Credit history - is it good?", FALSE),
        checkboxInput("marital", "Marital status - Single?", FALSE),
        checkboxInput("residence", "Real estate - have a house?", FALSE),
        radioButtons("income", "Income level:", c("Low" = 1,"Mid" = 2, "High" = 3)),
        actionButton("goButton", "Random Input")        
    )),
    column(7,
        h3('Risk profile'),
        p('Each point represents the estimated risk score using each one of the three databases. 
          The higher the score the lower the risk. From a financial intitution perpective, customers
          with a scorecard lower than 500 is not suitable for a loan. The grey line is the average
          credit score.'),
        plotOutput('newHist'),
        textOutput('text_score'),
        textOutput('text1'),
        h6('Disclaimer: The information on the Site is provided for educational or information purposes only; 
           it is not intended to be a substitute for an actual credit risk (scorecard) estimator.')
    )
    )
))

