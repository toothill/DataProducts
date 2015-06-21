---
title       : Data Products Project
subtitle    : Analyzing "mtcars" Data
author      : Rick Toothill
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Introduction - Developing Data Project

<h1>This project is required to demonstrate the following skills:</h1>

<ul>
  <li>Generation of a "data product"
  <li>Working with Shiny</li>
  <li>Working with Slidify</li>
</ul>

<h1>App: Analyze "mtcars" Data</h1>

<p>This application allows the user to easily analyze/visualize the factors influencing gas mileage in the "mtcars" data.  The user can choose among:

<ul>
  <li>Different car makes</li>
  <li>Various factors (independent variables)</li>
  <li>Even pick the color of points on the plot!</li>
</ul>


--- 

## How Does the App Work?

<h1>Inputs to the App are as follows:</h1>

<ul>
  <li>Select a specific make or All</li>
  <li>Select the independent variables</li>
  <li>Select the color of the points on the plot</li>
</ul>

<h1>Outputs of the App are as follows:</h1>

<ul>
  <li>Repeat of the make selected (or All)</li>
  <li>Calculatation of the average gas mileage for the make (or All)</li>
  <li>Plot showing relationship between MPG & factor selected</li>
  <B>NOTE:</B>  Point related to make selected are red triangles!
</ul>


---

## A Design Challenge ...
<h1>Selecting the mtcars subet based on make was a challenge</h1>
<BR>
<p>This design challenge was overcome using the following grep statement to extract the correct make based on the row name:</p>



```r
mtcars[grep("Merc*",rownames(mtcars)), ]
```

```
##              mpg cyl  disp  hp drat   wt qsec vs am gear carb
## Merc 240D   24.4   4 146.7  62 3.69 3.19 20.0  1  0    4    2
## Merc 230    22.8   4 140.8  95 3.92 3.15 22.9  1  0    4    2
## Merc 280    19.2   6 167.6 123 3.92 3.44 18.3  1  0    4    4
## Merc 280C   17.8   6 167.6 123 3.92 3.44 18.9  1  0    4    4
## Merc 450SE  16.4   8 275.8 180 3.07 4.07 17.4  0  0    3    3
## Merc 450SL  17.3   8 275.8 180 3.07 3.73 17.6  0  0    3    3
## Merc 450SLC 15.2   8 275.8 180 3.07 3.78 18.0  0  0    3    3
```

---

## Conclusion

<h3>This type of application makes it very easy to analyze mtcars data</h3>
<BR><BR>
<h3>Have Fun!!!!</h3>
