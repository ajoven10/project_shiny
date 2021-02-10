Course Project Developing Data Products
Polynomial classifier
========================================================
author: Alberto Joven
date: 2021/02/10
autosize: true


========================================================

This plot shows the results of two tests applied to 118 microchips, indicating in 
red the microchips that are correct according to quality control and in blue
those that are defective. 

A polynomial classifier is fitted to the Test 1 and Test2 data.

The degree of the polynomial is selected by the user between the values 1 and 9.


Plot with the points obtained by the microchips in Test 1 and  Test 2
========================================================






A level curve shows the points for which the classifier gives a probability equal 
to the microchip being defective or correct according to a polynomial fit of degree 4. 

<img src="Course_project-figure/unnamed-chunk-3-1.png" title="plot of chunk unnamed-chunk-3" alt="plot of chunk unnamed-chunk-3" style="display: block; margin: auto;" />


Confussion Matrix
========================================================
I add the confusion matrix resulting from fitting a polynomial classifier of degree 4


```
           Model
Real        Deficient Correct
  Deficient        49      11
  Correct           7      51
```

Try the app
=========================================================
You can test the app at the following link:

<http://ajoven10.shinyapps.io/Project_course>

And you can access the R code in the following link:

<https://github.com/ajoven10/project_shiny.git>



