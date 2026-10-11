# curveR 0.3.0

## Package versions in this release

| Package | Version |
|---|---|
| curveRcore | 0.5.0 |
| curveRfreq | 0.5.0 |
| curveRbayes | 0.5.0 |
| curveRweights | 0.2.1 |

## What's new

* **Out-of-range test samples.** Every back-calculated sample now carries
  censoring columns (`censor_class`, `censor_type`, `censor_lower`,
  `censor_upper`, from `curveRcore::classify_censoring_multiplate()`),
  asymmetric predictive quantiles (`conc_q_lo/med/hi`), threshold
  probabilities (`p_below_lloq`, `p_above_uloq`, `p_below_cutoff`) and
  censored-draw shares (`frac_draws_below_a/_above_d`), computed identically
  by both engines via `curveRcore::summarize_conc_draws()`.
* **New vignette "Analysing I-SPI exports"**: censored Gaussian (Tobit),
  survival-style and Bayesian censored analyses, threshold probabilities, and
  a simulation showing that inverse-variance weighting by a
  concentration-dependent SE biases group means toward the best-measured part
  of the curve — with a latent-variable alternative.

## Breaking changes

None. All new `$samples` columns are additive; `se_concentration` and `pcov`
are unchanged.

# curveR 0.2.0

## Package versions in this release

| Package | Version |
|---|---|
| curveRcore | 0.2.0 |
| curveRfreq | 0.1.0 |
| curveRbayes | 0.2.0 |
| curveRweights | 0.2.0 |

## What's new

* **curveRweights** added to the ecosystem — continuous power-law
  precision weights (`phi`, `beta1`) from calibration-curve uncertainty,
  replacing binary LLOQ/ULOQ gating for downstream analyses.
* **Hub umbrella vignette** (`curveR-methods-comparison`) extended with
  a new section "Precision-weighted downstream analysis" demonstrating
  `curveRweights::as_weight_data()` → `fit_precision_weights()` as the
  natural consumer of `$samples$se_concentration` and `$samples$pcov`
  produced by the calibration step.
* **Startup message** (`R/zzz.R`) updated to list all four packages with
  installed versions and a CmdStan installation hint when Stan components
  are absent.
* **Hub `_pkgdown.yml`** updated with a `curveRweights` reference section
  and a "precision-weighting" article entry.

## Breaking changes

None. The addition of curveRweights is additive; the `$samples` and
`$grid` column contracts that curveRweights binds against are unchanged.

---

# curveR 0.1.0

## Package versions in this release

| Package | Version |
|---|---|
| curveRcore | 0.1.0 |
| curveRfreq | 0.1.0 |
| curveRbayes | 0.1.0 |

## Initial release

* Meta-package hub linking curveRcore, curveRfreq, and curveRbayes.
* Startup message with per-package version report.
* Umbrella methods-comparison vignette covering preprocessing, NLS
  and Stan fitting, CDAN precision profiling, LOO-CV selection,
  back-calculation, and agreement assessment.
