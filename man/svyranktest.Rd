\name{svyranktest}
\alias{svyranktest}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Design-based rank tests
}
\description{
Design-based versions of k-sample rank tests.  The built-in tests are
all for location hypotheses, but the user could specify others.  
}
\usage{
svyranktest(formula, design, 
  test = c("wilcoxon", "vanderWaerden", "median","KruskalWallis"), ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{formula}{
Model formula \code{y~g} for outcome variable \code{y} and group \code{g}
}
  \item{design}{
A survey design object
}
  \item{test}{
    Which rank test to use: Wilcoxon, van der Waerden's normal-scores
    test, Mood's test for the median, or a function \code{f(r,N)} where
    \code{r} is the rank and \code{N} the estimated population
    size. "KruskalWallis" is a synonym for "wilcoxon" for more than two groups.
}
  \item{\dots}{ for future expansion}

}

\details{These tests are for the null hypothesis that the population or superpopulation distributions of the response variable are different between groups, targeted at population or superpopulation alternatives. 
The 'ranks' are defined as quantiles of the pooled distribution of the variable, so they do not just go from 1 to N; the null hypothesis does not depend on the weights, but the ranks do.   

The tests reduce to the usual Normal approximations to the usual rank tests under iid sampling.  Unlike the traditional rank tests, they are not exact in small samples. 
}

\value{
Object of class \code{htest}

Note that with more than two groups the \code{statistic} element of the return value holds the numerator degrees of freedom and the \code{parameter} element holds the test statistic. 
}
\references{
Lumley, T., & Scott, A. J. (2013). Two-sample rank tests under complex sampling. BIOMETRIKA, 100 (4), 831-842. 

}

\seealso{
\code{\link{svyttest}}, \code{\link{svylogrank}}
}
\examples{

data(api)
dclus1<-svydesign(id=~dnum, weights=~pw, fpc=~fpc, data=apiclus1)

svyranktest(ell~comp.imp, dclus1)
svyranktest(ell~comp.imp, dclus1, test="median")


svyranktest(ell~stype, dclus1)
svyranktest(ell~stype, dclus1, test="median")

str(svyranktest(ell~stype, dclus1))

## upper quartile
svyranktest(ell~comp.imp, dclus1, test=function(r,N) as.numeric(r>0.75*N))


quantiletest<-function(p){
	  rval<-function(r,N) as.numeric(r>(N*p))
	  attr(rval,"name")<-paste(p,"quantile")
	  rval
	}
svyranktest(ell~comp.imp, dclus1, test=quantiletest(0.5))
svyranktest(ell~comp.imp, dclus1, test=quantiletest(0.75))

## replicate weights

rclus1<-as.svrepdesign(dclus1)
svyranktest(ell~stype, rclus1)


}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{survey}
\keyword{htest}% __ONLY ONE__ keyword per line
