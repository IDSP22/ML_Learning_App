---
title: "Residual Sum of Squares and Total Sum of Squares"
output: html_document
---
### Residual Sum of Squares and Total Sum of Square
* Residual Sum of Squares
$$RSS = \sum_{i=1}^{n} e^2_i =\sum_{i=1}^{n} (y_i - \hat{\beta_0} - \hat{\beta_1}x_i)^2$$

* Here, $\varepsilon_i$ is the residual for the i-th observation
* Total Sum of Squares: corresponding to $$\hat{\beta_0} = \bar{y}$$ and $$\hat{\beta_1} = 0$$  
$$TSS =\sum_{i=1}^{n} (y_i - \bar{y})^2$$

### $R^2$: coefficient of determination  
$$R^2 = 1- \frac{RSS}{TSS}$$ 
* $R^2\in [0,1]$ is the percent of the variation in the response explained by the regression model
* $R^2$ is a common measure for how good a linear fit is
* Question: is a bigger $R^2$ always better?

### Least Square Estimates 
* Exact formula $$\hat{\beta_1} = \frac{\sum_{i=1}^{n}(x_i - \bar{x})(y_i - \bar{y})}{\sum_{i=1}^{n}(x_i - \bar{x})^2}$$
  + Remark: *every least squares regression line passes ($\bar{x}$, $\bar{y}$)*
* Optimization technique $$\frac{\partial L(\beta_0, \beta_1)}{\partial \beta_0}=0$$
$$\frac{\partial L(\beta_0, \beta_1)}{\partial \beta_1}=0$$





