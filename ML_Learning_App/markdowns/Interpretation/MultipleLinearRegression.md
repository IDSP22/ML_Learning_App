---
output: 
  html_document:
    keep_md: TRUE
---


### Is there a relationship between the reponse and all predictors?
<ul class="incremental">
<li><span class="math inline">\(H_0: \beta_1=\cdots=\beta_p=0\)</span></li>
<li><span class="math inline">\(H_a\)</span>: at least one of <span class="math inline">\(\beta_j\)</span> is non-zero</li>
<li>Did we miss <span class="math inline">\(\beta_0\)</span>?<br />
</li>
<li>This hypothesis test is performed by computing the F-statistic, <span class="math display">\[
F = \frac{(TSS-RSS)/p}{RSS/(n-p-1)}
\]</span></li>
<li>The larger the F-statistic, the strong evidence against null hypothesis.</li>
<li>Why do we need F-statistic and its p-values?  </li>
<li>Because inspecting individual t-statistic and p-value is NOT enough to answer the question posted on the top of the slide </li>
</ul>
