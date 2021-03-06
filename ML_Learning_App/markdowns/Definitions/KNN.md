---
title: "KNN"
output: html_document
---

### K Nearst Neighbor (KNN)
* Recall we assume $Y = f(X) + \varepsilon$
* Main idea of KNN: given a new observation x_0, find the K **nearst** observations among {x_i, i = 1,...,n}
* What is near? Measure by the Euclidean Distance $||x_i - x_0||_{2}^{2} = (x_i-x_0)^2$
* Let's say the smallest are x_i, ... , x_{ik}. Then, we have $$\hat{y_o} = \frac{1}{K}\sum_{j=1}^{K}{y_{ij}}$$