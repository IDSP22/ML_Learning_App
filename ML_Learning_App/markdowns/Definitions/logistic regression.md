---
title: "Logistic regression"
output: html_document
keep_md: true
---

### Logistic Regression
* Model the conditional probability $P(Y = 1|X)$ (compare with
linear model)
* The logistic (a.k.a. sigmoid) function $$f(x) = \frac{e^{\beta_0 + \beta_1x}}{1+e^{\beta_0 + \beta_1x}$$
* Logistic regression model: $$P(Y = 1|X) = f(x)
* Plot the sigmoid function when $\beta_0 = o$ and $\beta_1 = 1$  
* The sigmoid function f takes values between 0 and 1 ; perfect for modeling probability  
* Under the logistic regression model, the log-odds or logit is linear in the input variable X:
$$log(\frac{P(Y = 1|X)}{P(Y = 0|X}) = \beta_o + \beta_1X$$
* In some books, the above equation is the definition of logistic regression model, or called logit model. These two definitions are equivalent
* For logit function: https://en.wikipedia.org/wiki/Logit
* $\beta_1$ can be interpreted as the average change in log-odds associated with a one-unit increase in X
* $\beta_1$ does NOT correspond to the change in $P(Y = 1|X)$ associated with a one-unit increase in X
* **Questions**: recall the interpretation of the coefﬁcients in linear regression, and ﬁnd out the difference

### Fitting Logistic Regression
* The coefﬁcients $\beta_0$ and $\beta_1$ in the sigmoid function are unknown
* Need to estimate them from training data
* Given training data (pairs are independent of each other) $$\{(x_1, y_1 ), ... , (x_n, y_n)\}$$
* And let $p(x) = P(Y = 1|X)$. We would like to find $\hat{\beta_0}$ and $\hat{\beta_1}$ such that they maximize the likelihood function $l(\beta_0, \beta_1)$
$$l(\beta_0, \beta_1) = \prod_{i:y_i = 1}p(x_i)\prod_{i:y_j = 0}[1-p(x_j)]$$
* This is called a maximum likelihood approach
* The least squares method for linear regression is in fact also a maximum likelihood approach