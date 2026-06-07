# Add study design columns to `bead_assay_example` samples

Appends `timeperiod` and `cohort_arm` columns to a sample data frame
derived from `bead_assay_example`. Assignment is performed at the
`sampleid` level so the same subject carries the same design values
across all plates (curve_ids).

## Usage

``` r
add_bead_assay_design(
  samples,
  timeperiod_levels = c("pre", "post"),
  cohort_arm_levels = c("vaccine_a", "vaccine_b"),
  seed = 42L
)
```

## Arguments

- samples:

  Data frame. The filtered `$samples` element of `bead_assay_example`
  (or any subset thereof) that contains at least a `sampleid` column.

- timeperiod_levels:

  Character vector of length 2. Labels for the two collection
  timepoints. Default `c("pre", "post")`.

- cohort_arm_levels:

  Character vector of length 2. Labels for the two treatment arms.
  Default `c("vaccine_a", "vaccine_b")`.

- seed:

  Integer. Random seed for reproducible assignment. Default `42`.

## Value

The input `samples` data frame with two additional factor columns,
`timeperiod` and `cohort_arm`, joined by `sampleid`. Row order is
preserved. If either column already exists it is overwritten with a
warning.

## Details

The resulting 2 × 2 factorial design is balanced within the set of
unique `sampleid` values:

|            |            |              |
|------------|------------|--------------|
| timeperiod | cohort_arm | n per cell   |
| pre        | vaccine_a  | n_unique / 4 |
| pre        | vaccine_b  | n_unique / 4 |
| post       | vaccine_a  | n_unique / 4 |
| post       | vaccine_b  | n_unique / 4 |

**Why sampleid-level assignment?** In a typical multi-plate immunoassay
study the same serum specimen is run on every plate (one plate per
antigen). The treatment arm and collection timepoint are properties of
the subject, not the plate, so the same values must appear for a given
`sampleid` on every `curve_id`. Assigning at the row level would create
inconsistencies across plates.

**Balance constraint.** The function requires `n_unique %% 4 == 0`.
`bead_assay_example` has 20 unique sample IDs per set of curve_ids,
which satisfies this requirement (5 subjects per cell). For datasets
that do not divide evenly by 4, set `seed` and pass a custom
`timeperiod_levels` / `cohort_arm_levels` — the last cell will absorb
the remainder.

## See also

[`vignette("curveR-methods-comparison", package = "curveR")`](https://immunoplex.github.io/curveR/articles/curveR-methods-comparison.md)
for worked examples using this function.

## Examples

``` r
data("bead_assay_example", package = "curveRcore")

samp <- bead_assay_example$samples[
  bead_assay_example$samples$curve_id %in% c(1, 2, 3), ]

samp_design <- add_bead_assay_design(samp)
#> Warning: Overwriting existing `timeperiod` and/or `cohort_arm` columns.

# Balanced: 5 subjects per cell, replicated across 3 plates
with(samp_design, table(timeperiod, cohort_arm, curve_id))
#> , , curve_id = 1
#> 
#>           cohort_arm
#> timeperiod vaccine_a vaccine_b
#>       pre          6         5
#>       post         4         5
#> 
#> , , curve_id = 2
#> 
#>           cohort_arm
#> timeperiod vaccine_a vaccine_b
#>       pre          3         6
#>       post         3         8
#> 
#> , , curve_id = 3
#> 
#>           cohort_arm
#> timeperiod vaccine_a vaccine_b
#>       pre          6         4
#>       post         8         2
#> 

# Same subject keeps the same assignment on every plate
head(samp_design[, c("sampleid", "curve_id", "timeperiod", "cohort_arm")])
#>   sampleid curve_id timeperiod cohort_arm
#> 1     a001        1        pre  vaccine_a
#> 2     a002        1        pre  vaccine_a
#> 3     a003        1        pre  vaccine_a
#> 4     a004        1        pre  vaccine_a
#> 5     a005        1       post  vaccine_a
#> 6     a006        1       post  vaccine_b
```
