LDA
================

### Two Different Modeling Approaches

-   Logistic regression models *P*(*Y*=1\|*X*) by the logistic function
-   Linear discriminant analysis (LDA) models the conditional
    distribution of X given Y by Gaussian (a.k.a. normal) distributions
-   Bayes’ Theorem
    -   Suppose *π*<sub>*k*</sub> denotes prior probability *P*(*Y*=*k*)
        of the kth class
    -   Suppose *f*<sub>*k*</sub>(*X*) denotes the density function of X
        for an observation that comes from the kth class
        (i.e. *f*<sub>*k*</sub> is the p.d.f. of (*X*\|*Y*=*k*))
    -   Then we have
        $$P(Y = k\|X = x) = \\frac{π_kf_k(X)}{\\sum {l = 1}^{K}π_1f_1(x)}$$
        where K is the total number of classes

### Bayes Classifier

-   If a classiﬁer assigns an observation x to class k that has the
    largest
    *p*<sub>*k*</sub>(*x*) = *P*(*Y*=*k*\|*X*=*x*)
    , this classiﬁer has the minimum classiﬁcation error (Bayes
    classiﬁer, a.k.a. oracle classiﬁer)
-   In other words, Bayes classiﬁer assign x to arg max
    *π*<sub>*k*</sub>*f*<sub>*k*</sub>(*x*)
-   Often, estimating *π*<sub>*k*</sub> ’s is straightforward; but
    estimating *f*<sub>*k*</sub> involves some technicality

### Linear Discriminant Analysis (LDA)(for *p* = 1)

-   In LDA, we assume that *f*<sub>*k*</sub>(*x*) ’s are normally
    distributed, and they have the same standard deviation coefﬁcient:
    $$$ = \\frac{1}{\\sqrt{2\\pi}\\sigma}exp(-\\frac{1}{2\\sigma^2}(x-\\mu_k)^2$$
-   Under this assumption, it can be shown that assigning an observation
    to a class according to the largest *p*<sub>*k*</sub>(*x*) is the
    same as assigning to the observation according to the largest
    $$\\delta_k(x) = x \\cdot \\frac{\\mu_k}{\\sigma^2} - \\frac{\\mu^2\_{k}{2\\sigma^2}} + log(\\pi_k)$$
-   Note that the *δ*<sub>*k*</sub> function is linear in x. The LDA
    approximates *δ*<sub>*k*</sub>(*x*) by pluggin estimates for
    *π*<sub>*k*</sub>, *μ*<sub>*k*</sub>, and *σ*<sub>*k*</sub>:
    $$\\hat\\pi_k = n_k/n, \\hat\\mu_k = \\frac{1}{n_k}\\sum{i:yi=k}X_i$$
    where *n*<sub>*k*</sub> is the number of training observations in
    the kth class
    $$\\hat\\sigma^2 = \\frac{1}{n-K}\\sum{k=1}^K\\sum{i:yi=k}(x_i-\\hat\\mu_k)^2$$

### Linear Discriminant Analysis (LDA)

-   So for *p* = 1 the **discriminant function** is
    $$\\delta_k(x) = x \\cdot \\frac{\\mu_k}{\\sigma^2} - \\frac{\\mu^2\_{k}{2\\sigma^2}} + log(\\pi_k)$$
    *δ*<sub>*k*</sub>(*x*) is linear in x
-   LDA classiﬁer: assign x to class k for the largest
    *δ*<sub>*k*</sub>(*x*)
-   Question: for K = 2 , show LDA has a linear decision boundary

### Linear Discriminant Analysis (LDA, p \>1)

-   When *p* \> 1, assume
    *f*<sub>*k*</sub>(*x*) ∼ *N*(*μ*<sub>*k*</sub>,∑), a multivariate
    normal distribution with mean *μ*<sub>*k*</sub> and covariance
    matrix ∑ in ISLR is the probability density function of a
    multivariate normal variable)
-   Bayes classiﬁer assigns an observation to class k for the largest
    $$\\delta_k(x) = x^T\\sum^{-1}\\mu_k-\\frac{1}{2}\\mu\_{k}^{T}\\sum^{-1}\\mu_k+log\\pi_k$$
    Again, need to plug-in estimates of *μ*<sub>*k*</sub>, ∑, and
    *π*<sub>*k*</sub>
