# This function calculates the mean MPG for the make of 
# car entered
calcmpg <- function(mk) {

# Mean across all data, otherwise subset on make
     if(mk=="All") {
          mean(mtcars[,"mpg"])
     }
     else { 
          mean(mtcars[grep(paste(mk,"*",sep=""),
          rownames(mtcars)),
          "mpg"])
     }
}

# This function returns a data frame with including only the 
# car make selected 
submake <- function(mk) {
     mtcars[grep(paste(mk,"*",sep=""),rownames(mtcars)),]
}

shinyServer(function(input, output) {

     output$map <- renderPlot({
        
         # Identify factor of interest 
         data <- switch(input$feature,
                         "1" = mtcars$cyl,
                         "2" = mtcars$disp,
                         "3" = mtcars$hp,
                         "4" = mtcars$wt,
                         "5" = mtcars$am)

          # Define the text for x-axis label on plot
          datalab <- switch(input$feature,
                         "1" = "# of Cylinders",
                         "2" = "Displacement (cu. in.)",
                         "3" = "Horsepower",
                         "4" = "Weight (lb/1000)",
                         "5" = "Transmission (0=Auto, 1=Man)")

          lcol <- switch(input$ptcolor,
                         "1" = "black",
                         "2" = "blue",
                         "3" = "green4")   

          carmk <- switch(input$make,
                         "0" = "All",
                         "1" = "AMC",
                         "2" = "Cadillac",
                         "3" = "Camaro",
                         "4" = "Chrysler",
                         "5" = "Datsun",
                         "6" = "Dodge",
                         "7" = "Duster",
                         "8" = "Fiat",
                         "9" = "Ferrari",
                         "10" = "Ford",
                         "11" = "Honda",
                         "12" = "Hornet",
                         "13" = "Lincoln",
                         "14" = "Lotus",
                         "15" = "Maserati",
                         "16" = "Mazda",
                         "17" = "Merc",
                         "18" = "Pontiac",
                         "19" = "Porsche",
                         "20" = "Toyota",
                         "21" = "Valia",
                         "22" = "Volvo")

          mkdf <- submake(carmk) 

	     plot(mtcars$mpg ~ data, 
               main = "Car Factors Influencing Gas Mileage",
               xlab = datalab,
               ylab = "Miles per Gallon (MPG)",
               col=ifelse(rownames(mtcars) 
               %in% rownames(mkdf),"red",lcol),
               pch=ifelse(rownames(mtcars)
               %in% rownames(mkdf),17,19),
               cex=ifelse(rownames(mtcars)
               %in% rownames(mkdf),2,1)
          )
     })

     output$makempg <- renderPrint({
          carmk <- switch(input$make,
		              "0" = "All",
                         "1" = "AMC",
                         "2" = "Cadillac",
                         "3" = "Camaro",
                         "4" = "Chrysler",
                         "5" = "Datsun",
                         "6" = "Dodge",
                         "7" = "Duster",
                         "8" = "Fiat",
                         "9" = "Ferrari",
                         "10" = "Ford",
                         "11" = "Honda",
                         "12" = "Hornet",
                         "13" = "Lincoln",
                         "14" = "Lotus",
                         "15" = "Maserati",
                         "16" = "Mazda",
                         "17" = "Merc",
                         "18" = "Pontiac",
                         "19" = "Porsche",
                         "20" = "Toyota",
                         "21" = "Valia",
                         "22" = "Volvo")
  	
          calcmpg(carmk)
     })

     output$inputmake <- renderPrint({

          carmk <- switch(input$make,
                         "0" = "All",
                         "1" = "AMC",
                         "2" = "Cadillac",
                         "3" = "Camaro",
                         "4" = "Chrysler",
                         "5" = "Datsun",
                         "6" = "Dodge",
                         "7" = "Duster",
                         "8" = "Fiat",
                         "9" = "Ferrari",
                         "10" = "Ford",
                         "11" = "Honda",
                         "12" = "Hornet",
                         "13" = "Lincoln",
                         "14" = "Lotus",
                         "15" = "Maserati",
                         "16" = "Mazda",
                         "17" = "Merc",
                         "18" = "Pontiac",
                         "19" = "Porsche",
                         "20" = "Toyota",
                         "21" = "Valia",
                         "22" = "Volvo")
          carmk
     })

     output$docs <- renderPrint({
         writeLines("DOCUMENTATION FOR SHINYAPP")
         writeLines("")

         writeLines("This document provides basic documentation on running the ShinyApp created as part of the Coursera Developing Data Products Course.  The basic idea of the application is to enable analysis of the mtcars data set in R, specifically the influence of various factors on MPG by car make.")

         writeLines(" ")
	    writeLines(" ")

         writeLines("APPLICATION INPUTS")
         writeLines(" ")
         writeLines("Enter the following:")
         writeLines(" ")
         writeLines("Choose car make or All")
         writeLines("     -> a specific make or All for all makes.")
         writeLines(" ")

         writeLines("Choose a characteristic")
         writeLines("     -> choose the independent variable or factor for x-axis")

         writeLines(" ")

         writeLines("Select color of plot points")
         writeLines("     -> pick a color for points on plot")

         writeLines(" ")
         writeLines(" ")

         writeLines("APPLICATION OUTPUTS")

         writeLines(" ")

         writeLines("The application provides the following:")
         
         writeLines("You entered the following make: ")
         writeLines("     -> simply repeats the inputs on car make")
         
         writeLines(" ")

         writeLines("The average MPG for this make is:")
         writeLines("     -> calculates mean MPG for car make") 
         
         writeLines(" ")
         
         writeLines("Car Factors Influencing Gas Mileage Plots ")

         writeLines(" ")
         
         writeLines("     -> Compare make selected vs. all data")
   
         writeLines("     -> Analyze factors influencing MPG")
           
         writeLines("     -> Points in data set for factor<weight, hp, etc.> provided")
           
         writeLines("     -> Points for selected make are red triangles.")

     })
})