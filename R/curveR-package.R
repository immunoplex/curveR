#' curveR: Calibration Curve Ecosystem for Quantitative Immunoassays
#'
#' Meta-package for the curveR immunoassay calibration curve ecosystem.
#' Attaches \pkg{curveRcore} and \pkg{curveRfreq} and provides the
#' umbrella vignette that compares frequentist and Bayesian approaches.
#'
#' @section Package ecosystem:
#'
#' | Package | Role | Stan required? |
#' |---|---|---|
#' | \pkg{curveRcore}    | Shared models, inverses, derivatives, preprocessing, output class | No |
#' | \pkg{curveRfreq}    | Frequentist multi-start Levenberg-Marquardt NLS calibration | No |
#' | \pkg{curveRbayes}   | Bayesian hierarchical calibration via Stan/HMC | Yes |
#' | \pkg{curveRweights} | Continuous precision weights from calibration-curve uncertainty | Yes |
#'
#' @section Installation:
#'
#' ```r
#' # Full ecosystem (Stan required for Bayesian + weights components)
#' remotes::install_github("immunoplex/curveR")
#'
#' # Frequentist only — no Stan
#' remotes::install_github("immunoplex/curveRcore")
#' remotes::install_github("immunoplex/curveRfreq")
#'
#' # Add Bayesian fitting
#' remotes::install_github("immunoplex/curveRbayes")
#'
#' # Add precision weighting
#' remotes::install_github("immunoplex/curveRweights")
#'
#' # Stan backend (required for curveRbayes and curveRweights)
#' install.packages("cmdstanr",
#'                  repos = c("https://stan-dev.r-universe.dev",
#'                            getOption("repos")))
#' cmdstanr::install_cmdstan()
#' ```
#'
#' @section Hub vignette:
#'
#' The umbrella methods-comparison vignette lives exclusively in this
#' package because it requires all four packages simultaneously:
#' \code{vignette("curveR-methods-comparison", package = "curveR")}
#'
#' @name curveR-package
#' @aliases curveR
"_PACKAGE"
