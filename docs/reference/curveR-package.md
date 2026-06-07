# curveR: Calibration Curve Ecosystem for Quantitative Immunoassays

Meta-package for the curveR immunoassay calibration curve ecosystem.
Attaches curveRcore and curveRfreq and provides the umbrella vignette
that compares frequentist and Bayesian approaches.

## Package ecosystem

|  |  |  |
|----|----|----|
| Package | Role | Stan required? |
| curveRcore | Shared models, inverses, derivatives, preprocessing, output class | No |
| curveRfreq | Frequentist multi-start Levenberg-Marquardt NLS calibration | No |
| curveRbayes | Bayesian hierarchical calibration via Stan/HMC | Yes |
| curveRweights | Continuous precision weights from calibration-curve uncertainty | Yes |

## Installation

    # Full ecosystem (Stan required for Bayesian + weights components)
    remotes::install_github("immunoplex/curveR")

    # Frequentist only — no Stan
    remotes::install_github("immunoplex/curveRcore")
    remotes::install_github("immunoplex/curveRfreq")

    # Add Bayesian fitting
    remotes::install_github("immunoplex/curveRbayes")

    # Add precision weighting
    remotes::install_github("immunoplex/curveRweights")

    # Stan backend (required for curveRbayes and curveRweights)
    install.packages("cmdstanr",
                     repos = c("https://stan-dev.r-universe.dev",
                               getOption("repos")))
    cmdstanr::install_cmdstan()

## Hub vignette

The umbrella methods-comparison vignette lives exclusively in this
package because it requires all four packages simultaneously:
[`vignette("curveR-methods-comparison", package = "curveR")`](https://immunoplex.github.io/curveR/articles/curveR-methods-comparison.md)

## See also

Useful links:

- <https://immunoplex.github.io/curveR/>

- <https://github.com/immunoplex/curveR>

- Report bugs at <https://github.com/immunoplex/curveR/issues>

## Author

**Maintainer**: Michael Scot Zens <michael.s.zens@dartmouth.edu>

Authors:

- Hardik Gupta <hardik.gupta@dartmouth.edu>

- Seamus O. Stein <seamusstein@gmail.com>

- Anne G. Hoen <anne.g.hoen@dartmouth.edu>
