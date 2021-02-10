library(shiny)
library(faraway)
 data <- read.csv("ex2data2.txt", header=FALSE)
 
 X<- as.matrix(data[, c(1,2)])
 y<- as.factor(data[,3])
 levels(y) <- c("Deficient", "Correct")
 
 pos <- X[y=="Correct", c(1,2)]
 neg <- X[y=="Deficient", c(1,2)]
 X1=X[,1]
 X2=X[,2]
 
 u= seq(-1, 1.5, length.out=50)
 v= seq(-1, 1.5, length.out=50)
 z= matrix(0, nrow=length(u), ncol=length(v))
 P1= rep(u, each=length(v)); P2= rep(v, length(u))
 P = cbind(P1, P2)
 
shinyServer(function(input, output) {
  
   mm <- reactive({
     X <- polym(X, degree=input$modelo, raw=TRUE)
     P <- polym(P, degree=input$modelo, raw=TRUE)
     
     mod  = glm(y ~ ., data=data.frame(X), family="binomial")
     
     z = predict.glm(mod, newdata = data.frame(P), type="response")
     z = matrix(z, length(u), length(v), byrow=TRUE)
     
     z2 = predict.glm(mod,  type="response")
     
     z22 <- factor(levels = c("Deficient", "Correct")) 
     z22[z2 > 0.5] = "Correct"
     z22[z2 < 0.5] = "Deficient"
     
     t = table(Real=y, Model=z22)
     tabla = as.matrix(t)
     
     l <- list()
     l$mod <- mod
     l$z <- z
     l$t <- tabla
     l
     
    })
   
  
  output$plot1 <- renderPlot({
    
    plot(pos, pch=10, col="red", xlab="Microchip Test 1",
         ylab="'Microchip Test 2",
         xlim=c(min(X[,1]), max(X[,1])), ylim=c(min(X[,2]), max(X[,2])))
    points(neg, col="blue")
    contour(x=u, y=v, z=mm()$z, levels=c(0.5), add=TRUE)
    })

  output$tabla <- renderPrint({

    mm()$t
  })

  output$mod <- renderPrint({
    sumary(mm()$mod)

  })
   
   })  
  

