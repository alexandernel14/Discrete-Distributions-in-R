## Discrete Distributions in R.

# This script is intended for you to get familiar with discrete distributions in R.
# It will also allow you to comfortably confront various assignment questions
# that you will likely face.

#############################################################################################
# Distributions covered: Bernoulli, Binomial, Geometric,                                    #
#                        Negative Binomial and Poisson.                                     #
# Content covered: 1 Probability Mass Functions.                                            #
#                  2 Cumulative Distribution Functions.                                     #
#                  3 Moment Generating Functions.                                           #
#############################################################################################


# First ensure that the necessary packages are installed and loaded.
# Uncomment as needed

#install.packages("devtools") # to install the MGF function.
library(devtools)

#install.packages("stats") # for pmf, cdf.
library(stats)

#install_github("alexandernel14/MGF) # for Moment Generating Functions.
library(MGF)


#=====================================================================================#
# Bernoulli Distribution: Be(p)
# X ~ Be(0.5) == Bin(1,0.5)
# Make use of the Binomial Distribution but set the number of trials (size)
# to size = 1

# Bernoulli.example.pmf
# Probability that for a fair flip of a coin the outcome will be a success 
# Let heads represent a success (X = 1)
dbinom(x = 1, size = 1, prob = 0.5)

# MGF of the Bernoulli Distribution
mgf("Bernoulli")

#=====================================================================================#
# Binomial Distribution: Bin(n,p)
# X ~ Bin(10,0.5)

# Binomial.example.pmf
# Probability for a fair coin that we will observe 5 heads in 10 tosses.
dbinom(x = 5, size = 10, prob = 0.5)

# Binomial.example.cdf.1
# What is the probability of observing less than or equal to 5 heads in 10 tosses?

pbinom(q = 5, size = 10, prob = 0.5)
# Notice that the default value for the lower.tail argument is TRUE (P(X<=x))
pbinom(q = 5, size = 10, prob = 0.5,lower.tail = TRUE)

# Binomial.example.cdf.2
# What is the probability of observing more than 5 heads in 10 tosses of the coin?

# Using the lower tail
1 - pbinom(q = 5, size = 10, prob = 0.5)
# Using the lower.tail = FALSE
pbinom(q = 5, size = 10, prob = 0.5,lower.tail = FALSE)

# MGF of the Binomial Distribution
mgf("Binomial")

# Second moment (E[X^2]) and centralized moment (Var[X])
MGF_evaluator(distribution = "Binomial",n = 10, p = 0.5,order_of_moment = 2)

#=====================================================================================#
# Geometric Distribution: Geo(p)


# It is important to note that there are two different formulations of the Geometric
# and Negative Binomial Distributions.
# The ones used by R use the number of failures till the first (r) successes.
# This is different from the one used in the Probability Theory Playlist.
# To convert between the two it is quite simple, simply let:
# x = number_of_trials - 1

# Geometric.example.pmf
# Probability that the number of failures is 1 untill the first success (heads)
# Note that this is the same as the probability for the number of trials 
# until the first success to be 2.
dgeom(x = 1, prob = 0.5)

# Probability that the number of trials untill the first success (heads) = 1
dgeom(x = 0,prob = 0.5)

# Geometric.example.cdf.1
# Prob that number of failures till first success is less than or equal to 1
# The same as the probability that the number of trials till the first
# success is less than or equal to 2.
pgeom(q = 1, prob = 0.5, lower.tail = TRUE)

# Geometric.example.cdf.2
# Find the probability that the number of trials till the first success is
# greater than 2

# (a) Use the complement of the cdf
1 - pgeom(q = 1, prob = 0.5)

# (b) Use the lower.tail = FALSE
pgeom(q = 1, prob = 0.5,lower.tail = FALSE)

#Geometric Distribution Moment Generating Functions
# This is the mgf for the geometric distribution that represents
# the number of trials untill the first success.
mgf("Geometric")

#=====================================================================================#
# Negative Binomial Distribution: NB(r,p)
# Let X be a NB(3, 0.5)


# Negative.Binomial.example.pmf
# What is the probability that the number of trials till the rth success is:

# (a) 3 trials == 0 failures that means x = 0.
dnbinom(x = 0, size = 3, prob = 0.5)

# (b) 4 trials == 1 failure that means x = 1.
dnbinom(x = 1, size = 3, prob = 0.5)

# Negative.Binomial.example.cdf
# What is the probability that the number of trials untill the rth success is
# less than or equal to 4.
# This is the same as asking what is the probability that the number of failures
# is less than or equal to 1.

pnbinom(q = 1, size = 3, prob = 0.5, lower.tail = TRUE)

# Moment Generating Function of the Negative Binomial Distribution
mgf("Negative Binomial")
mgf("Geometric")
# Second moments of the NB(3,0.5)
MGF_evaluator(distribution = "Negative Binomial", order_of_moment = 2, r = 3, p = 0.5)

#=====================================================================================#
# Poisson Distribution
# X ~ Po(lambda = 5)
# Let Lambda be the number of arrivals per 10 minutes in a shop

# Poisson.example.pmf
# What is the probability that the number of arrivals in 20 minutes is 15.
# Lambda*20/10 = Lambda*2 = 5*2 = 10 is the "new lambda"
dpois(x = 15, lambda = 10)

# Poisson.example.cdf
# What is the probability that the number of people arriving in 10 minutes is 
# less than or equal to 7?
ppois(q = 7, lambda = 5)

# What is the probability that the number of people arriving in 10 minutes is
# greater than 10?
ppois(q = 10, lambda = 5,lower.tail = FALSE)

# Moment Generating Function
mgf("Poisson")

# 2nd order Moments of the Poisson Distribution
MGF_evaluator(distribution = "Poisson", order_of_moment = 2, lambda = 5)

#=====================================================================================#





