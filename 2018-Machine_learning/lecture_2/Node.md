# Supervised learning #1

## What and why of supervised learning
$x -> y$ using $f(x, \theta)$, $\theta$ is parameter; $f$ is a family of functions
* y: number, category, vector, image, sequence
* x: vector image, sequence, all of above

## Black-box vs interpretable

## What and how of supervised learning

$\min_\theta \sum_{i=1}^N L(y_i, f(x_i, \theta)) + R(\theta)$

1. examples/ data $(x_i, y_i)$
2. prediction function $f(x_i, \theta)$
3. scoring/ objective/ loss function $L$
4. regularization function $R(\theta)$
5. optimization algorithm

## Generalizaed linear models
https://en.wikipedia.org/wiki/Generalized_linear_model

* linear $\theta={w, b}$ st. $u = w^T x + b$
* nonlinaer $\hat{y}=f(u)$
* the inverse of the nonlinearity $f^{-1}$ is the link function

### Logistic regression -- binary classification
* logistic sigmoid nonlinearity -- $f(u) = \frac{1}{1+exp(-u)}$
* loss function -- cross-entropy $-\sum_i y_i \log \hat{y}_i +(1-y_i)\log(1-\hat{y}_i)$