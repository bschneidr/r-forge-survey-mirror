\name{multiframe}
\alias{multiframe}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  Dual-frame and multi-frame surveys
}
\description{
Given a list of samples from K different sampling frames and information
about which observations are in which frame, constructs an object
representing the whole multi-frame sample. If an observation is in the
overlap of multiple frames in the population it is effectively split
into multiple separate observations and so the weight is split if it is
sampled. 
}
\usage{
multiframe(designs, overlaps, estimator = c("constant", "expected"), theta = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{designs}{
List of survey design objects
  }
  \item{overlaps}{
list of matrices. Each matrix has K columns indicating whether the
observation is in frames 1-K. For the 'constant'-type estimator, this is
binary. For the \code{expected} estimator the entry in row i
and column k is the weight that observation i would have had if sampled
from frame k. 
  }
  \item{estimator}{
    \code{"constant"} specifies Hartley's estimators in which the
    partition of weights is the same for each observation.
    \code{"expected"} weights each observation by the reciprocal of the
    expected number of times it is sampled; it's is the
    Hansen-Hurvitz-type estimator proposed by Kalton and
    Anderson. 
  }
  \item{theta}{
  Scale factors adding to 1 for splitting the overlap between frames
  }
}
\details{
All these estimators assume sampling is independent between frames, and
any observation sampled more than once is present multiple times in the data.
  }
\value{
Object of class \code{multiframe}
}
\references{
Bankier, M. D. (1986) Estimators Based on Several Stratified Samples With Applications to Multiple Frame Surveys. Journal of the American Statistical Association, Vol. 81, 1074 - 1079.

Hartley, H. O. (1962) Multiple Frames Surveys. Proceedings of the American Statistical Association, Social Statistics Sections, 203 - 206.
Hartley, H. O. (1974) Multiple frame methodology and selected applications. Sankhya C, Vol. 36, 99 - 118.

Kalton, G. and Anderson, D. W. (1986) Sampling Rare Populations. Journal of the Royal Statistical Society, Ser. A, Vol. 149, 65 - 82.

}

\seealso{
  \code{\link{svydesign}}

  For a simple introduction:
  Metcalf P and Scott AJ (2009) Using multiple frames in health
  surveys. Stat Med 28:1512–1523

  For general reference:
  Lohr SL, Rao JNK. Inference from dual frame surveys. Journal of the American Statistical Association 2000; 94:271–280.

  Lohr SL, Rao JNK. Estimation in multiple frame surveys. Journal of the American Statistical Association 2006; 101:1019–1030.
}
\examples{

}