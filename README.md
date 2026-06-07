# curveR <a href="https://immunoplex.github.io/curveR/"><img src="man/figures/logo.png" align="right" height="139" alt="curveR website" /></a>

Calibration curve ecosystem for quantitative immunoassays.

## What is curveR?

curveR is a suite of four R packages that share a common data contract,
identical model definitions, and a common output class for immunoassay
calibration curve analysis. Frequentist and Bayesian results are
directly comparable — fitting engine is a single function-call difference.

## The four packages

| Package | What it does | Install if you want |
|---|---|---|
| [curveRcore](https://immunoplex.github.io/curveRcore/) | Shared models, inverses, derivatives, preprocessing, output class | Always required |
| [curveRfreq](https://immunoplex.github.io/curveRfreq/) | Frequentist multi-start Levenberg–Marquardt NLS calibration | Fast fitting, no Stan |
| [curveRbayes](https://immunoplex.github.io/curveRbayes/) | Bayesian hierarchical calibration via Stan (4PL/5PL/Gompertz) | Full posterior uncertainty, multi-plate pooling |
| [curveRweights](https://immunoplex.github.io/curveRweights/) | Continuous precision weights from calibration-curve uncertainty | Weighted downstream analysis instead of a binary LLOQ/ULOQ gate |

## Installation

```r
# Full ecosystem — installs curveRcore + curveRfreq immediately;
# curveRbayes and curveRweights available once CmdStan is installed.
remotes::install_github("immunoplex/curveR")

# Stan backend (required for curveRbayes and curveRweights)
install.packages("cmdstanr",
                 repos = c("https://stan-dev.r-universe.dev",
                           getOption("repos")))
cmdstanr::install_cmdstan()

# Frequentist only — no Stan needed
remotes::install_github("immunoplex/curveRcore")
remotes::install_github("immunoplex/curveRfreq")

# Add precision weighting after the above
remotes::install_github("immunoplex/curveRweights")
```

## Quick start

```r
library(curveR)   # attaches curveRcore + curveRfreq
library(curveRcore)

data(bead_assay_example, package = "curveRcore")

# Preprocess standards
std_pre <- curveRcore::preprocess_standards(
  data                 = bead_assay_example$standards,
  response_variable    = "mfi",
  independent_variable = "dilution",
  is_log_response      = TRUE,
  is_log_independent   = TRUE,
  std_curve_conc       = 10000
)

# Fit frequentist curves for all curve_ids
mp_freq <- curveRfreq::fit_calibration_freq_multiplate(
  standards          = std_pre$data,
  samples            = bead_assay_example$samples,
  response_var       = "mfi",
  is_log_response    = TRUE,
  is_log_independent = TRUE,
  std_curve_conc     = 10000
)

# One-row-per-curve summary
curveRfreq::summary_table(mp_freq)

# Fit Bayesian curves (requires CmdStan)
if (requireNamespace("curveRbayes", quietly = TRUE)) {
  mp_bayes <- curveRbayes::fit_calibration_bayes(
    standards          = std_pre$data,
    samples            = bead_assay_example$samples,
    response_var       = "mfi",
    is_log_response    = TRUE,
    is_log_independent = TRUE,
    std_curve_conc     = 10000,
    seed               = 42
  )
  # Compare frequentist vs Bayesian back-calculations
  curveRcore::compare_calibrations(mp_freq, mp_bayes)
}

# Precision weighting — samples must carry design columns
if (requireNamespace("curveRweights", quietly = TRUE)) {
  wd <- curveRweights::as_weight_data(
    mp_freq, design = c("timeperiod", "cohort_arm")
  )
  pw <- curveRweights::fit_precision_weights(wd)
  pw
}
```

---

## Methodology vignette

The full manuscript-quality methods comparison — preprocessing, model
forms, NLS engine, hierarchical Stan model, MCMC diagnostics, LOO-CV
selection, CDAN precision profiling, sample back-calculation, agreement
assessment, and precision-weighted downstream analysis — is in:

```r
vignette("curveR-methods-comparison", package = "curveR")
```

This vignette lives exclusively in the hub because it requires all four
packages simultaneously.

---

## CRAN and r-universe availability

| Package | CRAN | r-universe / GitHub |
|---|---|---|
| curveRcore | Planned | ✔ github.com/immunoplex/curveRcore |
| curveRfreq | Planned | ✔ github.com/immunoplex/curveRfreq |
| curveRbayes | r-universe + GitHub only (CmdStan dependency) | ✔ github.com/immunoplex/curveRbayes |
| curveRweights | r-universe + GitHub only (CmdStan dependency) | ✔ github.com/immunoplex/curveRweights |

## License

AGPL-3.0
