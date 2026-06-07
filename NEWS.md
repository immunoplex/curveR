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
