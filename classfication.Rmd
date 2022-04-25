---
title: "classification"
output: html_document
keep_md: true
---

### Classification
* Classfication: supervised learning when outcomes are categorical (a.k.a qualitative)
* The categorical outcomes (responses) are usually called class labels
* Both classification and regression are supervised learning 
* Classification is perhaps the most widely used machine learning methods  
* There are many off-the-shelf classification methods. 
  In this lecture, we will cover two most common (basic) ones:
  + logistic regression
  + linear discriminant analysis (LDA)
  
### What is the usual objective for classification?
* Binary classification is the most common classification scenario
* Features $x \in R^p$ and class labels $Y \in {0,1}$
* A classifier h is some function (usually data-dependent function) that maps the feature space into the label space. One can think of a classifier as a data-dependent partition of future space
* The classification error (risk) is the probability of misclassification. In other words:  
$$P(h(X) <> Y)$$  
  where P is regarding the joint distribution of (X,Y)
*$P(h(X) <> Y)$ is usually denoted by R(h)  
* Often (NOT always), we construct classifiers to minimize the classification error
