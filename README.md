## Introduction

This is a repo for scOrange workshop of **Single cell genome data hands-on**

### Install scOrange
https://singlecell.biolab.si/download/


### Course
1. Workflows in Orange
2. Loading data
3. Saving and sharing
4. Basic exploration of sc data
5. Data projection
6. Filtering
7. Normalization
8. Marker genes
9. Clustering and population discovery
10. Differential expression
11. Cross-validation
12. Reproducing of cell-type classification
13. Combining two datasets
14. Predicitoin on independent dataset
15. Loading from tab-delimited
16. Conclusion and survey

### Notebooks
* Exercise: sections 1-3
* Exercise\_sc: sections 4 - 7
* Exercise\_gene: sections 8-10
* Exercise\_classifer: sections 11-12
* Exercise\_classifer\_adv: 13-14

### Tricks or warnings
* Supported date file: excel (blank as missing data), tab (? as missing data), csv, google sheets
* Density plot: scatter plot —> class density
* One cannot do cluster on t-SNE plots (overfitting etc.).
* Score genes: score using mean, variance, cv, information gain, disperity etc.
* Additional marker gene can be found at https://www.bdbiosciences.com/documents/cd_marker_handbook.pdf
* Add additional marker genes to the database for one's own problem (load data from excel)
* Test if tSNE projection is faithful -- if the cluster in tSNE space (low dim) agrees with that in the orginal space (high dim). To solve this, one should do clustering first, then doing tSNE.
* Preferred clusterring methods: Louvain clustering (flexible shape), better than k-means (gaussian shape) and hireachical clustering.
* Multi-selection on plots: cmd key
* Fold change: ratio between mean expression in selected cells to that in non-selected ones
* Classifer: random forest, logistic regression, NN etc
* Cross-validation
    * train classifier on partial data and test on remaining datasets
    * performance metric: confusion matrix
    * CV -- Test and Score moduale
