---
title: "Mutliple Regression"
output: html_document
---

### Mutiple Regression: more than one predictors
*In addition to scalar input $x \in R$, we can consider vector input $x \in R^p$*  

* **p** is feature dimension of input (sometimes use **d** for dimension)
* Inputs of form $$x =\begin{bmatrix} x1  \\ x2 \\... \\x_p \\ \end{bmatrix} $$
* Call x *the covariates, independent variables, explanatory variables, features, attributes* or *predictor variable* 
  + Note that variables are usually NOT independent of one another

### When we use more than one input variables
* Make predictions $$\hat{y} = \hat{\beta_0} + \sum_{j=1}^{p} \hat{\beta_j}{x_j}$$
* Model the data as $$y = \beta_0 + \sum_{j=1}^{p}{\beta_j}{x_j} + {\varepsilon}$$  
  where $\varepsilon$ is the random noise
  
### Fitting a multiple regression
* Making predictions using $$\hat{y} = \hat{\beta_0} + \sum_{j=1}^{p} \hat{\beta_j}{x_j}$$
* Fit as in single variable case. Solve (least squares criterion) $$minimize\sum_{i=1}^{n}(y_i - \beta_0 - \beta^{T}x_i)^2$$
* Since each observation has *p* values, $x_i = (x_{i1}, ... , x_{ip})^T$, where i = 1, ..., n. In matrix notation, let $y = (y_1, ..., y_n)^T$ and
$$\begin{bmatrix} 
1  & 0 \\ 
3 & 1 \\ 
\end{bmatrix}
*
\begin{bmatrix} 
5 & 1 \\ 
3 & 4 \\ 
\end{bmatrix}$$  
  where x_ij is the *i*th observation of the *j*th variable
* LS Solution $$\hat\beta = (X^TX)^{-1}Xy$$