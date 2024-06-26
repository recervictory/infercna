% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ggcna.R
\name{ggcna}
\alias{ggcna}
\title{Plot a CNA heatmap}
\usage{
ggcna(
  m,
  reorder = FALSE,
  reorder.by = NULL,
  groups = NULL,
  interorder = TRUE,
  genome = "hg19",
  dist.method = "euclidean",
  cluster.method = "complete",
  hide = c("21", "Y"),
  limits = c(-1, 1),
  y.angle = 90,
  legend.title = NULL,
  title = "Copy-number aberrations",
  axis.text.size = 12,
  legend.height = 0.3,
  legend.width = 0.5,
  cols = NULL,
  ...
)
}
\arguments{
\item{m}{CNA matrix (genes by cells). <m> can be generated using `infercna::infercna`.}

\item{reorder}{reorder cells using hierarchical clustering, Default: FALSE}

\item{reorder.by}{reorder cells by genes on select chromosomes or chromosome arms, e.g., c("7", "10", "1p", "19q"). Default: NULL}

\item{groups}{groups of cells to delineate and label on the plot (e.g., cell types, samples, or subclones). If <reorder> is TRUE, ordering will be performed within groups, Default: NULL}

\item{interorder}{reorder by hierarchical clustering betweeen groups, Default: TRUE}

\item{genome}{set genome to use ('hg19' or 'hg38'), Default: 'hg19'}

\item{dist.method}{distance metric for reordering, Default: 'euclidean'}

\item{cluster.method}{linkage method for reordering, Default: 'complete'}

\item{hide}{hide x-axis labels for specific chromosomes (e.g., small chromosomes whose labels would overlap flanking labels), Default: c("21", "Y")}

\item{limits}{for the colour key; replaces out of bounds values with the nearest limit. Default: c(-1, 1)}

\item{y.angle}{y-axis labels' angle, Default: 90}

\item{legend.title}{legend title, Default: NULL}

\item{title}{plot title, Default: 'Copy-number aberrations'}

\item{axis.text.size}{x and y axes label size, Default: 12}

\item{legend.height}{legend bar height, Default: 0.3}

\item{legend.width}{legend bar width, Default: 0.5}

\item{cols}{custom colour palette (character vector), Default: NULL}

\item{...}{other arguments to pass to `scalop::graster`.}
}
\value{
a `ggplot` object
}
\description{
Uses `ggplot::geom_raster` to generate a plot of copy number aberration (CNA) values. Delineates chromosomes and chromosome arms, and provides options for clustering cells or groups of cells (e.g., cell types, samples, or subclones) prior to plotting.
}
\details{
DETAILS
}
\examples{
cna = infercna::infercna(mgh125, isLog=T, refCells=refCells)
malCells = list(Malignant=setdiff(colnames(mgh125), unlist(refCells)))
groups = c(malCells, refCells)
p = ggcna(m, reorder=T, groups=refCells)
}
