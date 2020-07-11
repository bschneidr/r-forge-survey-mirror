\name{newsvyquantile}
\alias{svyquantile}
\alias{svyquantile.survey.design}
\alias{svyquantile.svyrep.design}
\alias{print.newsvyquantile}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Quantiles under complex sampling.
}
\description{
Estimates quantiles and confidence intervals for them. This function was completely re-written for version 4.1 of the survey package, and has a wider range of ways to define the quantile. See \code{link{qrule}} for a list of them. 
}
\usage{
svyquantile(x, design, quantiles, ...)
\method{svyquantile}{survey.design}(x, design, quantiles, alpha = 0.05,
                      interval.type = c("mean", "beta","xlogit", "asin","score"),
                      na.rm = FALSE,  se = TRUE,
                      qrule=c("math","school","shahvaish","hf1","hf2","hf3","hf4","hf7","hf8"),
                      df = NULL, ...)
\method{svyquantile}{svyrep.design}(x, design, quantiles, alpha = 0.05,
                      interval.type = c("mean", "beta","xlogit", "asin","quantile"),
                      na.rm = FALSE, se = TRUE,
                      qrule=c("math","school","shahvaish","hf1","hf2","hf3","hf4","hf7","hf8"),
                      dfd = NULL, return.replicates=FALSE,...)		      
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
A one-sided formula describing variables to be used
}
  \item{design}{
Design object
}
  \item{quantiles}{
Numeric vector specifying which quantiles are requested
}
  \item{\dots}{
For future expansion
}
}
\details{
The \code{p}th quantile is defined as the value where the estimated cumulative
distribution function is equal to \code{p}. As with quantiles in
unweighted data, this definition only pins down the quantile to an
interval between two observations, and a rule is needed to interpolate.
The default is the mathematical definition, the lower end of the
quantile interval; \code{qrule="school"} uses the midpoint of the
quantile interval; see \code{\link{qrule}} for all the definitions.
  
By default, confidence intervals are estimated using Woodruff's (1952) method,
which involves computing the quantile, estimating a confidence interval
for the proportion of observations below the quantile, and then
transforming that interval using the estimated CDF.  In that context,
the \code{interval.type} argument specifies how the confidence interval
for the proportion is computed, matching \code{\link{svyciprop}}.

There are two exceptions. For \code{svydesign} objects,
\code{interval.type="score"} asks for the Francisco & Fuller confidence
interval based on inverting a score test. According to Dorfmann &
Valliant, this interval has inferior performance to the \code{"beta"}
and \code{"logit"} intervals; it is provided for compatibility.

For replicate-weight designs, \code{interval.type="quantile"} ask for an
interval based directly on the replicates of the quantile. This interval
is not valid for jackknife-type replicates, though it should perform well for
bootstrap-type replicates, BRR, and SDR.

The \code{df} argument specifies degrees of freedom for a t-distribution
approximation to distributions of means. The default is the design degrees of
freedom. Specify \code{df=Inf} to use a Normal distribution (eg, for compatibility).

When the standard error is requested, it is estimated by dividing the
confidence interval length by the number of standard errors in a t
confidence interval with the specified \code{alpha}. For example, with
\code{alpha=0.05} and \code{df=Inf} the standard error is estimated as the confidence
interval length divided by \code{2*1.96}.

}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
  Dorfman A, Valliant R (1993) Quantile variance estimators in complex
  surveys. Proceedings of the ASA Survey Research Methods Section. 1993: 866-871
  
  Francisco CA, Fuller WA (1986) Estimation of the distribution
  function with a complex survey. Technical Report, Iowa State
  University.
  
  Woodruff RS (1952) Confidence intervals for medians and other
  position measures. JASA 57, 622-627.
}



\seealso{
  \code{\link{qrule}}
  \code{\link{oldsvyquantile}}

}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (x, design, quantiles, ...) 
UseMethod("svyquantile", design)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{survey}% use one of  RShowDoc("KEYWORDS")
\keyword{univar}% at least one, from doc/KEYWORDS