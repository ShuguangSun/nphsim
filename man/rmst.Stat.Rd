% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rmst.Stat.r
\name{rmst.Stat}
\alias{rmst.Stat}
\title{Restricted Mean Survival Test Statistic}
\usage{
rmst.Stat(survival, cnsr, trt, stra = NULL, fparam = NULL)
}
\arguments{
\item{survival}{time-to-event variable}

\item{cnsr}{censoring variable: 1=censoring, 0=event}

\item{trt}{treatment varaible. Accepted values are either "experiment" or "control"}

\item{stra}{stratification variable. Default is \code{NULL} (currently not implemented)}

\item{fparam}{the cutoff time for RMST analysis. If larger than the minimum of the largest observed time 
on each of the two arms, the minimum value will be used.}
}
\value{
The function return a list with the follow components
\describe{
 \item{pval}{One-sided p-Value from RMST comparing treatment arm to control arm} 
 \item{tau}{time cutoff used for each analysis}
 \item{est}{Estimated difference between treatment and control arm}
 \item{estlb, estub}{Lower and upper bound of the estimated difference}
 }
}
\description{
RMST method with user specified trucation time.
}
\details{
Restricted mean survival test at specified cutoff time. This is adopted from \code{\link[survRM2:rmst2]{rmst2}}.
}
\examples{
# RMST on the simulated data
library(survRM2)
medC = 6 
hr <- 0.7
intervals <- NULL 
gamma <- c(2.5, 5,  7.5,  10) ## a ramp-up enrollment
R     <- c(2  , 2,  2  ,  6 ) ## enrollment period: total of 12 months
eta <- -log(0.99) ## 1\% monthly dropout rate
sim1 <- nphsim(nsim=1,lambdaC=log(2)/medC,lambdaE=log(2)/medC*hr, ssC=300,ssE=300,
               intervals=intervals,gamma=gamma, R=R,eta=eta)
test1 <- simtest(x=sim1, anaD=c(250,300), method=rmst.Stat,fparam=12)
test1$result[]

# direct function call (without cutoff)
rmst.Stat(surv=sim1$simd$survival, cnsr=sim1$simd$cnsr, trt=sim1$simd$treatment,fparam=12)

}
