# Supervised learning #1

## What and why of supervised learning
$x -> y$ using $f(x, \theta)$, $\theta$ is parameter; $f$ is a family of functions
* y: number, category, vector, image, sequence
* x: vector image, sequence, all of above

## Black-box vs interpretable

## What and how of supervised learning

$\min_\theta \Sum_{i=1}^N L(y_i, f(x_i, \theta)) + R(\theta)$

1. examples/ data $(x_i, y_i)$
2. prediction function $f(x_i, \theta)$
3. scoring/ objective/ loss function $L$
4. regularization function $R(\theta)$
5. optimization algorithm

## Generalizaed linear models
* linear $\theta={w, b}$ st. $u = w^T x + b$
* nonlinaer $\hat{y}=f(u)$

