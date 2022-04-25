---
output: 
  html_document:
    keep_md: TRUE
---



<h1>Estimating the Coefficients (1)</h1>
<ul class="incremental">



Suppose the training data contains \((x_1, y_1), (x_2, y_2), \cdots, (x_n, y_n)\)\(x_i\)</span> is the height of parent \(i\) and \(y_i\) is height of child \(i\). \(n\) is the sample size.


    index        Child          Parent    
----------- --------------  --------------- 
      1         66.43592       70.85107
      2         65.94336	     69.85889  
      3         64.27886	     65.27814
      4         63.85191	     64.03263
      5         63.19229	     63.41899
      6         65.00112       67.82480

<li><strong>Predictions</strong>: For an estimate <span class="math inline">\(\hat\beta_0\)</span> and <span class="math inline">\(\hat\beta_1\)</span>, the prediction is <span class="math inline">\(\hat{y} = \hat\beta_0 + \hat\beta_1 x\)</span> of the height of child if a parent has height <span class="math inline">\(x\)</span>.</li>
<li><strong>Loss function</strong>: How do we measure the quality of the fit. First, define the <em>residual</em> <span class="math inline">\(e_i = y_i -\hat{y}_i\)</span>. <span class="math display">\[
  Loss(y, \hat{y}) = (y - \hat{y})^2
\]</span></li>
<li>Why does this loss function make sense? It is the only loss function that makes sense?</li>
</ul>


<div id="estimating-the-coefficients-2" class="slide section level2">
<h1>Estimating the Coefficients (2)</h1>
<ul class="incremental">
<li><p><strong>Training Loss</strong>: we can just sum up the loss for all <span class="math inline">\(n\)</span> observations. <span class="math display">\[\begin{align}
L(\hat\beta_0, \hat\beta_1) &amp;= \sum_{i=1}^n Loss(y_i, \hat{y_i})\\
&amp;= \sum_{i=1}^n (y_i - \hat{y_i})^2 \\
&amp;= \sum_{i=1}^n (y_i - \hat\beta_0 - \hat\beta_1 x_i)^2
\end{align}\]</span></p></li>
<li><p>Find <span class="math inline">\(\hat\beta_0\)</span> and <span class="math inline">\(\hat\beta_1\)</span> that <strong>minimizes</strong> the overall training loss. <span class="math display">\[
\mathop{\rm minimize}_{\beta_0, \beta_1} L(\beta_0, \beta_1)
\]</span></p></li>
<li><p>The minimizer is called the <strong>least squares estimate</strong>, denoted as <span class="math inline">\(\hat \beta_0\)</span> and <span class="math inline">\(\hat \beta_1\)</span>.</p></li>
</ul>
</div>
<div id="residual-sum-of-squares-and-total-sum-of-squares" class="slide section level2">
<h1>Residual Sum of Squares and Total Sum of Squares</h1>
<ul class="incremental">
<li>Residual Sum of Squares <span class="math display">\[\begin{align}
RSS &amp;= \sum_{i=1}^n e_i^2\\
&amp;= \sum_{i=1}^n(y_i - \hat\beta_0 - \hat\beta_1 x_i)^2\\
&amp;= (y_1 - \hat\beta_0 - \hat \beta_1 x_1)^2 + \cdots +  (y_n - \hat\beta_0 - \hat \beta_1 x_n)^2
\end{align}\]</span></li>
<li>Here, <span class="math inline">\(e_i\)</span> is the residual for the <span class="math inline">\(i\)</span>-th observation.</li>
<li>Total Sum of Squares: corresponding to <span class="math inline">\(\hat\beta_0 = \bar y\)</span> and <span class="math inline">\(\hat\beta_1 = 0\)</span>. <span class="math display">\[\begin{align}
TSS &amp;= \sum_{i=1}^n(y_i - \bar y)^2
\end{align}\]</span></li>
</ul>
</div>
<div id="r2-coefficient-of-determination" class="slide section level2">
<h1><span class="math inline">\(R^2\)</span>: coefficient of determination</h1>
<p><span class="math display">\[\begin{align}
R^2 &amp;= 1 - \frac{RSS}{TSS}
\end{align}\]</span></p>
<ul class="incremental">
<li><span class="math inline">\(R^2\in[0,1]\)</span> is the percent of the variation in the response explained by the regression model</li>
<li><span class="math inline">\(R^2\)</span> is a common measure for how good a linear fit is.</li>
<li>Q: is a bigger <span class="math inline">\(R^2\)</span> always better?</li>
</ul>
</div>
<div id="least-square-estimates" class="slide section level2">
<h1>Least Square Estimates</h1>
<ul class="incremental">
<li>Exact formula <span class="math display">\[
\hat \beta_1 = \frac{\sum_{i=1}^n (x_i-\bar x)(y_i - \bar y)}{\sum_{i=1}^n (x_i - \bar x)^2} \text{ and } \hat\beta_0 = \bar y - \hat\beta_1 \bar x
\]</span>
<ul class="incremental">
<li>Remark: <span style="color: blue;">every least squares regression line passes <span class="math inline">\((\bar x, \bar y)\)</span></span>.</li>
</ul></li>
<li>Optimization techniques. <span class="math display">\[\begin{align}
\frac{\partial L(\beta_0, \beta_1)}{\partial\beta_0} &amp;=0\\
\frac{\partial L(\beta_0, \beta_1)}{\partial\beta_1} &amp;=0
\end{align}\]</span></li>
</ul>
</div>



