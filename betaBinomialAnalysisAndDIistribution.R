## We're given 2 students a multi-choice exam w/40 questions, where each 
# question has 4 choices. We don't know how much the students have studied for this exam,  
# but we think that they will do better than just guessing randomly.

#Q1 What are the parameters of interest?
#Q2 What is our likelihood?
#Q3 What prior should we use?
theta = seq(0,1,0.01)
plot(theta, dbeta(theta,1,1), type="l")
plot(theta, dbeta(theta,4,2), type="l")
plot(theta, dbeta(theta,8,4), type="l")

#Q4 What is the probability that P(theta>0.25), P(theta>0.5), P(theta>0.8)?
1-pbeta(0.25, 8,4)
1-pbeta(0.5, 8, 4)
1-pbeta(0.8, 8, 4)

#Q5 Suppose the first students gets 33 questions right, what is the posterior
# distribution for theta1? P(theta1>0.25)? P(theta1>0.5)? P(theta1>0.8)
lines(theta, dbeta(theta, 41, 11))
plot(theta, dbeta(theta, 41, 11), type="l")
lines(theta, dbeta(theta, 8, 4), lty=2)
lines(theta, dbinom(33, size=40, p=theta), lty=3)
lines(theta, 44*dbinom(33, size=40, p=theta), lty=3)

1-pbeta(0.25, 41, 11)
1-pbeta(0.5, 41, 11)
1-pbeta(0.8, 41, 11)

#equal tailed 95% credible interval
qbeta(0.025, 41, 11)
qbeta(0.975, 41, 11)

#Q6 Suppose the second student gets 24 questions right, what is the posterior
# distribution for theta2? P(theta2>0.25)? P(theta2>0.5)? P(theta2>0.8)
plot(theta, dbeta(theta, 32, 20), type="l")
lines(theta, dbeta(theta, 8, 4), lty=2)
lines(theta, 44*dbinom(24, size=40, p=theta), lty=3)


1-pbeta(0.25,32, 20)
1-pbeta(0.5, 32, 20)
1-pbeta(0.8, 32, 20)

qbeta(0.025, 32, 20)
qbeta(0.975, 32, 20)

#Q7 What is the posterior probability that theta1>theta2
# Estimate by simulation: draw 1K
# samples from each and see how often we observe theta1>theta2
theta1 = rbeta(1000, 41, 11)
theta2 = rbeta(1000, 32, 20)
mean(theta1>theta2)


#Note for other Distributions
#dgamma,pgamma,ggamma,rgamma, etc
