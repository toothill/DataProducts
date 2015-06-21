shinyUI(fluidPage(

     titlePanel("Developing Data Products Project"),

     sidebarLayout(

          sidebarPanel(

               h3("Explore MPG across Make & Features"),
      
               selectInput("make", 
                  label = h4("Choose car make or ALL:"), 
                  choices = list("All" = 0,
                            "AMC" = 1,
                            "Cadillac" = 2,
                            "Camaro" = 3,
                            "Chrysler" = 4,
                            "Datsun" = 5,
                            "Dodge" = 6,
                            "Duster" = 7,
                            "Fiat" = 8,
                            "Ferrari" = 9,
                            "Ford" = 10,
                            "Honda" = 11,
                            "Hornet" = 12,
                            "Lincoln" = 13, 
                            "Lotus" = 14,
                            "Maserati" = 15,
                            "Mazda" = 16,
                            "Mercedes" = 17,
                            "Pontiac" = 18,
                            "Porsche" = 19,
                            "Toyota" = 20,
                            "Valiant" = 21,
                            "Volvo" = 22),
                  selected = 0
               ),



               selectInput("feature", 
                  label = h4("Choose a characteristic:"), 
                  choices = list("Nbr of Cylinders" = 1,
                            "Displacement" = 2,
                            "Horsepower" = 3, 
                            "Weight" = 4,
                            "Transmission Type" = 5),
                  selected = 1
               ),

               selectInput("ptcolor",
                  label = h4("Select color of plot points:"),
                  choices = list("Black" = 1, 
                                 "Blue" = 2,
                                 "Green" = 3),
	             selected = 1
               )

          ),

          mainPanel(
             tabsetPanel(
                tabPanel("Output", 
                   h4('You entered the following car make:'),
                   verbatimTextOutput("inputmake"),
		        h4('The average MPG for this make is:'),
                   verbatimTextOutput("makempg"),
                   plotOutput("map")
                ),
                tabPanel("Documentation",
                   verbatimTextOutput("docs")
                )
             ) 
          )
     )

))