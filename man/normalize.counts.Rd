% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/normalize.counts.R
\name{normalize.counts}
\alias{normalize.counts}
\title{Normalization to count data}
\usage{
normalize.counts(counts, group = NULL, lib.sizes = NULL, method = c("TMM",
  "RLE", "upperquartile", "cqn"), verbose = TRUE, cqn.annotation = NULL,
  ...)
}
\arguments{
\item{counts}{matrix or data frame containing the count data.}

\item{group}{vector giving the experimental treatment/condition for each sample (optional).}

\item{lib.sizes}{vector giving library size of each sample. If lib.sizes=NULL, which is 
default, then library size will be estimated as the column sum of each 
sample.}

\item{method}{specific normalization method. The optional methods are 'TMM' (Robinson and Oshlack, 2010), 
"RLE" (Anders and Huber, 2010), "upperquartile" (Bullard et al, 2010), 
"cqn" (Hansen, Irizarry, and Wu, 2012). These normalization methods are applied using 
the edgeR package, except "cqn" which uses the cqn package.}

\item{verbose}{logical, if True, progress will be reported.}

\item{cqn.annotation}{optional, gene information used in cqn method, 
containing GC contents and gene length.}

\item{...}{other arguments could be passed to normalization methods.}
}
\value{
a numeric matrix containing normalized count data.
}
\description{
Normalizing count data to eliminate composition biases between libraries.
}
\examples{
library(MDSeq)
data(sampleData)

dat <- sample.exprs
dim(dat)

# Lowly expressed gene filtered by mean cpm value
dat.filtered <- filter.counts(dat, mean.cpm.cutoff = 0.1)
dim(dat.filtered)

# normalize by using TMM method   
dat.normalized <- normalize.counts(dat.filtered, method="TMM") 

}

