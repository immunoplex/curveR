# ============================================================
# curveR hub — setup and deployment
# ============================================================
#
# Run from the curveR/ project root (folder with DESCRIPTION).
# Prerequisites: all four spoke packages installed locally,
# CmdStan installed, git configured with access to immunoplex/curveR.


# ── Step 1: Install all four spoke packages ─────────────────

remotes::install_github("immunoplex/curveRcore")
remotes::install_github("immunoplex/curveRfreq")
remotes::install_github("immunoplex/curveRbayes")
remotes::install_github("immunoplex/curveRweights")

# Verify all four load cleanly
library(curveR)
library(curveRcore)
library(curveRfreq)
library(curveRbayes)
library(curveRweights)


# ── Step 2: Copy the vignette into vignettes/ ───────────────
#
# curveR-methods-comparison.Rmd must be in vignettes/.
# Copy it now (it was your input file):
#
#   file.copy("path/to/curveR-methods-comparison.Rmd",
#             "vignettes/curveR-methods-comparison.Rmd")
#
# Then insert the precision-weighting section at the right point:
# Open vignettes/curveR-methods-comparison.Rmd and find the line:
#
#   ---
#   # References
#
# Insert the full contents of vignettes/precision-weighting-section.Rmd
# BEFORE that line.  Then delete precision-weighting-section.Rmd.
#
# The vignette YAML header must have:
#   bibliography: manuscript_calibration-curve-regression.bib
# Copy your .bib file to vignettes/ as well.


# ── Step 3: Generate documentation ──────────────────────────

devtools::document()


# ── Step 4: Check the package ───────────────────────────────

devtools::check()

# Expected: 0 errors, 0 warnings, 0 notes.
# Bayesian + weights chunks use eval=has_bayes / eval=has_weights
# guards so the vignette builds even without CmdStan on CRAN check servers.


# ── Step 5: Place logos ──────────────────────────────────────

dir.create("man/figures", recursive = TRUE, showWarnings = FALSE)
# logo.png and logo_small.png should already be in man/figures/
# (they were placed there in the file delivery).
stopifnot(file.exists("man/figures/logo.png"))
stopifnot(file.exists("man/figures/logo_small.png"))


# ── Step 6: Build favicons ───────────────────────────────────

pkgdown::build_favicons(overwrite = TRUE)


# ── Step 7: Copy pkgdown/extra.css from any spoke ───────────
#
# All sites share the same extra.css for consistent padding.
# Copy it from curveRbayes or curveRcore if you have it locally,
# or create it:

dir.create("pkgdown", showWarnings = FALSE)
writeLines(
  c(
    "/* Push hero content below the fixed navbar */",
    ".jumbotron, .homepage-title, #pkgdown-sidebar, .contents {",
    "  padding-top: 1.5rem;",
    "}",
    ".page-header {",
    "  margin-top: 2rem;",
    "  padding-top: 1rem;",
    "}",
    ".template-home main {",
    "  padding-top: 2.5rem;",
    "}"
  ),
  con = "pkgdown/extra.css"
)


# ── Step 8: Build the site ───────────────────────────────────
#
# This will take several minutes — the methods-comparison vignette
# runs live Bayesian sampling.  For faster iteration during development,
# build only the non-vignette parts first:

pkgdown::build_home()
pkgdown::build_reference()
pkgdown::build_news()

# Then build vignettes (slow — only when vignette content changes):
pkgdown::build_articles()

# Or rebuild everything at once:
# pkgdown::build_site(dest_dir = "docs")


# ── Step 9: Verify locally ───────────────────────────────────
#
# Open docs/index.html and confirm:
#   ✔ Logo appears in the navbar
#   ✔ Home page shows the four-package table from README
#   ✔ Reference page shows 10 sections spanning all four packages
#   ✔ Articles tab shows curveR-methods-comparison
#   ✔ Spoke package links (sidebar) resolve correctly
#   ✔ MathJax renders the sigma/phi/beta equations in the vignette


# ── Step 10: Git init and push ───────────────────────────────
#
# From the terminal (Git Bash or RStudio terminal):

# git init
# git remote add origin https://github.com/immunoplex/curveR.git
# git add -A
# git status        # confirm no .exe, .RDataTmp, docs/ is present
# git commit -m "Initial release: curveR 0.2.0 hub meta-package"
# git branch -M main
# git push --force origin main


# ── Step 11: Enable GitHub Pages ─────────────────────────────
#
# Go to: https://github.com/immunoplex/curveR/settings/pages
#   Source:  Deploy from a branch
#   Branch:  main
#   Folder:  /docs
#   → Save
#
# Wait 1–2 minutes, then visit:
#   https://immunoplex.github.io/curveR/


# ── Step 12: Set repo metadata on GitHub ─────────────────────
#
# On https://github.com/immunoplex/curveR:
#   Description:  Calibration curve ecosystem for quantitative immunoassays
#   Website:      https://immunoplex.github.io/curveR/
#   Topics:       r, immunoassay, calibration-curve, stan, bayesian, luminex
#
# On the org profile (github.com/immunoplex):
#   Pin curveR first, then curveRcore, curveRfreq, curveRbayes, curveRweights.
#   Set each spoke repo's Website field to https://immunoplex.github.io/curveR/


# ── Troubleshooting ──────────────────────────────────────────
#
# "Cannot find package 'curveRbayes'" during build_site()
#   → remotes::install_github("immunoplex/curveRbayes")
#
# Reference page shows "topic not found" for a spoke function
#   → The function is not exported from that package; check @export
#     and re-run devtools::document() in the spoke, then reinstall it
#
# Vignette build errors with "cmdstanr not found"
#   → Check that has_bayes guard is TRUE; install cmdstanr from
#     the stan r-universe (see Step 1)
#
# Spoke cross-links (e.g. [curveRcore::logistic4()]) show 404
#   → Add url: to each spoke's _pkgdown.yml (already done in each spoke)
#
# build_articles() takes > 30 minutes
#   → The Bayesian vignette refits Stan models; acceptable for CI.
#     For local iteration, use pkgdown::build_article("curveR-methods-comparison")
#     with cached cmdstanr models (set output_dir in the vignette)
