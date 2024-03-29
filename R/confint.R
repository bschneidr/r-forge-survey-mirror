format.perc<-function (probs, digits) {
  paste(format(100 * probs, trim = TRUE,
               scientific = FALSE, digits = digits),  "%")
}

confint.svystat<-function (object, parm, level = 0.95, df=Inf,...) {
  tconfint(object, parm, level,df)
}

confint.svrepstat<-confint.svystat
confint.svyby<-confint.svystat
confint.svyratio<-confint.svystat


tconfint<-function (object, parm, level = 0.95, df=Inf) 
{
    cf <- coef(object)
    if (is.matrix(cf)) {
        pnames <- sapply(X = colnames(cf),
                         FUN = function(x) paste(rownames(cf), x, sep = "_"),
                         simplify = TRUE)
        pnames <- as.vector(pnames)
        cf <- as.vector(cf)
        names(cf) <- pnames
    } else {
        pnames <- names(cf)
    }
    if (missing(parm)) 
        parm <- pnames
    else if (is.numeric(parm)) 
        parm <- pnames[parm]
    a <- (1 - level)/2
    a <- c(a, 1 - a)
    pct <- format.perc(a, 3)
    fac <- qt(a, df=df)
    ci <- array(NA, dim = c(length(parm), 2L), dimnames = list(parm, pct))
    if (!is.matrix(cf)) {
      ses <- unlist(SE(object))[parm %in% pnames]
    } else {
      ses <- as.vector(SE(object))[parm %in% pnames]
    }
      ci[] <- cf[parm] + ses %o% fac
      ci
}
