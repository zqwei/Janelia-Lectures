# Supervised learning #1

## What and why of supervised learning
$x -> y$ using $f(x, \theta)$, $\theta$ is parameter; $f$ is a family of functions
* y: number, category, vector, image, sequence
* x: vector image, sequence, all of above

## Black-box vs interpretable

## What and how of supervised learning

$\min_\theta \sum_{i=1}^N L(y_i, f(x_i, \theta)) + R(\theta)$

1. examples/ data $(x_i, y_i)$
2. prediction function $\hat{y_i}=f(x_i, \theta)$
3. scoring/ objective/ loss function $L$
4. regularization function $R(\theta)$
5. optimization algorithm

## Generalizaed linear models
https://en.wikipedia.org/wiki/Generalized_linear_model

* linear $\theta={w, b}$ st. $u = w^T x + b$
* nonlinaer $\hat{y}=f(u)$
* the inverse of the nonlinearity $f^{-1}$ is the link function

### Logistic regression -- binary classification
* logistic sigmoid nonlinearity -- $f(u) = \frac{1}{1+\exp(-u)}$
* loss function -- cross-entropy $-\sum_i y_i \log \hat{y}_i +(1-y_i)\log(1-\hat{y}_i)$

## Neural data analysis
![](BMI_diag.png)

* encoding problem
* decoding problem

### Poisson regression
* $y(t)$ ~Poiss$ (\hat{y}(t))$
* $f(u) = \exp(u)$
* loss function $\sum_i \hat{y}_i - y_i\log\hat{y}_i$

## Sparse regression
https://en.wikipedia.org/wiki/Regularization_(mathematics)

* how to find infomative features
* penality for using features
* trade off between $R(\theta)$ and $L(y, \hat{y})$
* standand choice -- $R(w)=||w||_1$

### Lasso -- sparse L1 regularized regression
https://en.wikipedia.org/wiki/Lasso_(statistics)

* Lasso path diagram (x-axis -- decreasing $\lambda$ or penality)

![](http://scikit-learn.org/stable/_images/sphx_glr_plot_lasso_lars_001.png)

* l1 based feature selection

## Cross-validation

### Cross validation of time series data
Time series data is characterised by the correlation between observations that are near in time (autocorrelation). However, classical cross-validation techniques such as `KFold` and `ShuffleSplit` assume the samples are independent and identically distributed, and would result in unreasonable correlation between training and testing instances (yielding poor estimates of generalisation error) on time series data. Therefore, it is very important to evaluate our model for time series data on the “future” observations least like those that are used to train the model. To achieve this, one solution is provided by `TimeSeriesSplit`.


## Ensemble learning
http://www.scholarpedia.org/article/Ensemble_learning

https://github.com/KordingLab/Neural_Decoding

https://arxiv.org/pdf/1708.00909.pdf

* Bagging
* Boosting
* AdaBoost

https://www.analyticsvidhya.com/blog/2018/06/comprehensive-guide-for-ensemble-models/


### Random forest regression

#### XGBoost
https://www.analyticsvidhya.com/blog/2016/03/complete-guide-parameter-tuning-xgboost-with-codes-python/

## Exercises and milestones for lab 2

### Using sklearn and statsmodels to train linear models
1. Have Anaconda (conda) installed
2. Make sure scikit-learn is installed:
	`pip install scikit-learn`
   as well as scipy:
   	`pip install scipy`
3. Install the statsmodels package:
	`pip install statsmodels`
4. Open and run the NeuralMLHints.ipynb notebook

### Exercises
1. Decode hand position from neural activity using a linear decoder (Ridge regression)
2. Find the 10 best neurons for decoding hand position (Multi task Lasso regression)
3. Build the best possible nonlinear decoder
4. Build an encoding model for neuron 0 to predict neural activity from hand position and velocity using a linear-nonlinear-Poisson GLM

### Links
https://github.com/KordingLab/spykesML
