# Issue 3 — Build the `curveR` hub (updated for four packages)

**Do last.** The hub aggregates all four packages.

You already drafted a hub strategy. This plan
is that draft, with `immunoplex` and the precision-weighting workflow
folded in.

Hub repo: `github.com/immunoplex/curveR`. Hub site: `https://immunoplex.github.io/curveR`.

---

## 1. What the hub is (three jobs in one repo)

1. **The pkgdown ecosystem website** — the single URL you put in every paper, README, and talk.
2. **A meta-package** — a real installable package that re-exports the spokes and handles
   installation in one command.
3. **The home of the umbrella vignette** — the manuscript-quality methods-comparison vignette
   (`curveR-methods-comparison.Rmd`) lives here and nowhere else, because it needs all packages
   at once and so cannot live in any single spoke without circular/unfulfillable dependencies.

---

## 2. The four packages.

Concretely:

- **Dependency graph** 
  ```
  curveRcore   (anchor, no internal deps)
  curveRfreq    → curveRcore
  curveRbayes   → curveRcore        (+ Suggests cmdstanr)
  curveRweights → curveRcore        (+ Suggests cmdstanr)   
  curveR (hub)  → curveRcore, curveRfreq ; Suggests curveRbayes, curveRweights, cmdstanr
  ```
- **Meta-package `DESCRIPTION`:**
  ```
  Package: curveR
  Title: Calibration Curve Ecosystem for Quantitative Immunoassays
  Imports:  curveRcore, curveRfreq
  Suggests: curveRbayes, curveRweights, cmdstanr
  ```
  `curveRweights` goes in **Suggests**, not Imports — like `curveRbayes`, it needs CmdStan, a
  non-R external dependency. A user without Stan still gets the full frequentist + (non-Stan parts
  of the) workflow from the Imports.
- **Startup message (`R/zzz.R`):** add a `curveRweights` line and a "for precision weighting:
  install cmdstanr" note alongside the existing Bayesian one.
- **"Why N packages?" table** on the landing page gains a row:

  | Package | What it does | Install if you want |
  |---|---|---|
  | curveRcore | Shared models, preprocessing, output class | Always required |
  | curveRfreq | Frequentist NLS fitting | Fast fitting, no Stan |
  | curveRbayes | Bayesian hierarchical fitting via Stan | Full uncertainty, multi-plate pooling |
  | curveRweights | Continuous precision weights (`phi`, `beta1`) from `pcov` | Weighted downstream analysis instead of a binary LLOQ/ULOQ gate |

- **Installation paths** documented on the site:
  ```r
  # Full ecosystem (recommended; Stan needed for bayes + weights)
  remotes::install_github("immunoplex/curveR")

  # Frequentist only (no Stan)
  remotes::install_github("immunoplex/curveRcore")
  remotes::install_github("immunoplex/curveRfreq")

  # Add precision weighting (needs CmdStan)
  remotes::install_github("immunoplex/curveRweights")
  ```

---

## 3. The umbrella vignette: extend it with the weighting step

The methods-comparison vignette already covers preprocess → freq/bayes fit → selection → precision
profiling → back-calculation → detection limits. **Add precision weighting as the natural
downstream of back-calculation**, since `curveRweights` is the consumer of exactly the `pcov` / 'se_concentration'
`$samples` that this vignette already produces. Either a new top-level section or an appendix
(suggest a section, "Precision-weighted downstream analysis," after *Sample Concentration
Back-Calculation*):

1. Ensure the sample frame carries design columns (`timeperiod`, `cohort_arm`) into `$samples`.
2. `wd <- curveRweights::as_weight_data(mp, design = c("timeperiod","cohort_arm"))`.
3. `pw <- curveRweights::fit_precision_weights(wd)`; interpret `phi` (variance inflation) and
   `beta1` (precision exponent) in the assay's terms.
4. Contrast the continuous weights against the binary in-range/out-of-range gate the rest of the
   vignette uses — the payoff being that out-of-range observations keep contributing signal
   instead of being discarded.

Use the Stan precompute/caching pattern from Issue 2 so the hub site build stays tractable.

---

## 4. Hub `_pkgdown.yml` — aggregate all four references

The hub site pulls reference docs from all four packages (all must be installed in the hub's CI;
see §6). Extend the draft's `reference:` with a `curveRweights` block and add the new core
extractors:

```yaml
url: https://immunoplex.github.io/curveR
template:
  bootstrap: 5
  bootswatch: flatly          # same theme as the spokes (Issue 2)

articles:
  - title: "Getting started"
    contents: [get-started]
  - title: "Full methodology"
    contents:
    - methods-comparison      # curveR-methods-comparison_v2 — hub only
    - model-forms
  - title: "Single-method workflows"
    contents: [frequentist-only, bayesian-only, precision-weighting]   # weighting added

reference:
  - title: "curveRcore: Models & mathematics"
    contents: [starts_with("logistic"), starts_with("gompertz"),
               starts_with("inv_"), starts_with("dydx_"), starts_with("d2x_"),
               starts_with("grad_"), make_inv_and_grad_fixed, available_models]
  - title: "curveRcore: Preprocessing & extractors"
    contents: [preprocess_standards, compute_concentration, correct_prozone,
               compute_log_response, resolve_fixed_lower_asymptote,
               adaptive_constraint_profile, tidy_samples, tidy_grid]   # extractors NEW
  - title: "curveRcore: Model selection & output class"
    contents: [assess_model_eligibility, select_best_eligible,
               new_calibration_result, new_calibration_result_multiplate,
               compare_calibrations, compare_parameters, compare_samples,
               agreement_metrics]
  - title: "curveRfreq"
    contents: [fit_calibration_freq, fit_calibration_freq_multiplate,
               fit_ensemble_nls, predict_grid_freq, predict_samples_freq,
               summary_table, collect_samples]
  - title: "curveRbayes"
    contents: [fit_calibration_bayes, fit_bayes_single, compile_stan_model,
               predict_grid_bayes, predict_samples_bayes,
               compute_loo, compare_models_loo]
  - title: "curveRweights"                                              # ENTIRE BLOCK NEW
    contents: [as_weight_data, fit_precision_weights, predict_weights, join_weights]

home:
  links:
  - { text: "curveRcore on GitHub",   href: https://github.com/immunoplex/curveRcore }
  - { text: "curveRfreq on GitHub",   href: https://github.com/immunoplex/curveRfreq }
  - { text: "curveRbayes on GitHub",  href: https://github.com/immunoplex/curveRbayes }
  - { text: "curveRweights on GitHub", href: https://github.com/immunoplex/curveRweights }
```

---

## 5. Landing page (`curveR/README.md`)

Answer a new visitor's first-30-seconds questions: what is this, why four packages, how to install,
a 10-line example, where the full vignette is. Reuse the draft's structure with the four-package
table from §2 and the precision-weighting line added. Quick example should end at back-calculation
**and** show the one-liner that produces weights, to advertise the fourth package:

```r
library(curveR)
mp <- fit_calibration_freq_multiplate(standards = ..., samples = ...)   # samples carry design cols
pw <- curveRweights::fit_precision_weights(
        curveRweights::as_weight_data(mp, design = c("timeperiod","cohort_arm")))
```

---

## 6. CI/CD — rebuild-on-spoke-release, now with four triggers

Each spoke (Issue 2) deploys its own site. The hub additionally rebuilds its aggregated site
whenever **any** spoke tags a release, via `repository_dispatch`:

- Hub workflow listens for event types
  `[curveRcore-release, curveRfreq-release, curveRbayes-release, curveRweights-release]`
  (add the fourth, missing from the draft) plus `workflow_dispatch`.
- Build step installs all four packages from GitHub (+ CmdStan, since the umbrella vignette now
  fits both Bayesian curves *and* the weights model — apply the Issue-2 Stan strategy here too),
  then `pkgdown::build_site()` and deploy to Pages.
- Each spoke's release workflow fires a dispatch to `immunoplex/curveR` with its event type, using
  an `ECOSYSTEM_PAT` secret. Add this step to the **`curveRweights`** release workflow as well as
  the other three.

---

## 7. CRAN / r-universe strategy (four packages)

Submission order, anchored on the dependency graph:

1. `curveRcore` — no internal deps; submit first.
2. `curveRfreq` — after core is on CRAN.
3. `curveRbayes` — hardest CRAN case (CmdStan); `cmdstanr` is **not on CRAN** (Stan r-universe).
4. `curveRweights` — same CmdStan complication as bayes.
5. `curveR` (meta-package) — last.

Standard resolution for the two Stan packages: keep `curveRbayes` **and** `curveRweights` on
r-universe + GitHub, submit `curveRcore`, `curveRfreq`, and the meta-package to CRAN, and document
the split on the hub site (tidyverse handles analogous cases this way). The meta-package's
`Suggests` (not Imports) on the two Stan packages is what makes a CRAN-only install still valid.

---

## 8. Versioning matrix

Coordinated `major.minor.patch`; bump **all four** majors together on a breaking contract change
(e.g. a change to the `$samples`/`$grid` columns that `curveRweights` binds against). Record the
matrix in the hub `NEWS.md`:

```markdown
# curveR <x.y.z>
## Package versions in this release
- curveRcore   a.b.c
- curveRfreq   a.b.c
- curveRbayes  a.b.c
- curveRweights a.b.c
## Breaking changes
- curveRweights now consumes calibration_result(_multiplate); foreign-data input
  moved behind as_weight_data.data.frame().
```

---

## 9. GitHub org presentation

Pin order on the org profile: `curveR` (hub) first, then `curveRcore`, `curveRfreq`,
`curveRbayes`, `curveRweights`. Set every repo's **Website** field to the hub URL so a visitor who
lands on any spoke is one click from the whole picture. Apply the shared topic tags from Issue 2.

---

## 10. Acceptance criteria

- `immunoplex/curveR` exists as an installable meta-package: `install_github("immunoplex/curveR")`
  pulls core + freq (Imports) and offers bayes + weights (Suggests) with an informative startup
  message naming all four and the CmdStan note.
- Hub site live at `https://immunoplex.github.io/curveR` with a grouped reference index covering
  **all four** packages and articles including the **extended** methods-comparison vignette (now
  with the precision-weighting section) — and that vignette exists *only* in the hub.
- `repository_dispatch` rebuild workflow fires from all four spokes (weights included) and the hub
  site rebuilds within minutes of any spoke release.
- README four-package table, installation paths, and CRAN/r-universe note all reflect four
  packages; all `your-org` placeholders replaced with `immunoplex`.
- Versioning matrix in `NEWS.md` lists four packages.
