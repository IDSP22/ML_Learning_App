---
title: "relationship b/w response and all predictors"
output: html_document
---

### Is there a relationship between the response and all predictors
* H_0: $\beta_1  = ... =\beta_p = 0$
* H_a: at least on of $\beta_j$ is non-zero
* Did we miss $\beta_0$?
* This hypothesis test is performed by computing the F-statistic $$F = \frac {(TSS-RSS)/P} {RSS/(n-p-1)}$$
* The larger the F-statistic, the stronger the evidence is against null hypothesis