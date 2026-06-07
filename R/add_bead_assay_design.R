#' Add study design columns to \code{bead_assay_example} samples
#'
#' Appends \code{timeperiod} and \code{cohort_arm} columns to a sample
#' data frame derived from \code{bead_assay_example}.  Assignment is
#' performed at the \code{sampleid} level so the same subject carries
#' the same design values across all plates (curve_ids).
#'
#' The resulting 2 × 2 factorial design is balanced within the set of
#' unique \code{sampleid} values:
#'
#' | timeperiod | cohort_arm | n per cell |
#' |---|---|---|
#' | pre | vaccine_a | n_unique / 4 |
#' | pre | vaccine_b | n_unique / 4 |
#' | post | vaccine_a | n_unique / 4 |
#' | post | vaccine_b | n_unique / 4 |
#'
#' @param samples Data frame.  The filtered \code{$samples} element of
#'   \code{bead_assay_example} (or any subset thereof) that contains at
#'   least a \code{sampleid} column.
#' @param timeperiod_levels Character vector of length 2.  Labels for
#'   the two collection timepoints.  Default
#'   \code{c("pre", "post")}.
#' @param cohort_arm_levels Character vector of length 2.  Labels for
#'   the two treatment arms.  Default
#'   \code{c("vaccine_a", "vaccine_b")}.
#' @param seed Integer.  Random seed for reproducible assignment.
#'   Default \code{42}.
#'
#' @return The input \code{samples} data frame with two additional
#'   factor columns, \code{timeperiod} and \code{cohort_arm}, joined by
#'   \code{sampleid}.  Row order is preserved.  If either column already
#'   exists it is overwritten with a warning.
#'
#' @details
#' \strong{Why sampleid-level assignment?}  In a typical multi-plate
#' immunoassay study the same serum specimen is run on every plate
#' (one plate per antigen).  The treatment arm and collection timepoint
#' are properties of the subject, not the plate, so the same values
#' must appear for a given \code{sampleid} on every \code{curve_id}.
#' Assigning at the row level would create inconsistencies across plates.
#'
#' \strong{Balance constraint.}  The function requires
#' \code{n_unique \%\% 4 == 0}.  \code{bead_assay_example} has 20
#' unique sample IDs per set of curve_ids, which satisfies this
#' requirement (5 subjects per cell).  For datasets that do not divide
#' evenly by 4, set \code{seed} and pass a custom
#' \code{timeperiod_levels} / \code{cohort_arm_levels} — the last
#' cell will absorb the remainder.
#'
#' @seealso
#' \code{vignette("curveR-methods-comparison", package = "curveR")}
#' for worked examples using this function.
#'
#' @export
#'
#' @examples
#' data("bead_assay_example", package = "curveRcore")
#'
#' samp <- bead_assay_example$samples[
#'   bead_assay_example$samples$curve_id %in% c(1, 2, 3), ]
#'
#' samp_design <- add_bead_assay_design(samp)
#'
#' # Balanced: 5 subjects per cell, replicated across 3 plates
#' with(samp_design, table(timeperiod, cohort_arm, curve_id))
#'
#' # Same subject keeps the same assignment on every plate
#' head(samp_design[, c("sampleid", "curve_id", "timeperiod", "cohort_arm")])
add_bead_assay_design <- function(
    samples,
    timeperiod_levels  = c("pre", "post"),
    cohort_arm_levels  = c("vaccine_a", "vaccine_b"),
    seed               = 42L) {

  # ── Input validation ────────────────────────────────────────
  if (!is.data.frame(samples))
    stop("`samples` must be a data frame.", call. = FALSE)
  if (!"sampleid" %in% names(samples))
    stop("`samples` must contain a `sampleid` column.", call. = FALSE)
  if (length(timeperiod_levels) != 2L)
    stop("`timeperiod_levels` must have exactly 2 elements.", call. = FALSE)
  if (length(cohort_arm_levels) != 2L)
    stop("`cohort_arm_levels` must have exactly 2 elements.", call. = FALSE)

  if (any(c("timeperiod", "cohort_arm") %in% names(samples)))
    warning("Overwriting existing `timeperiod` and/or `cohort_arm` columns.",
            call. = FALSE)

  # ── Build per-subject assignment ────────────────────────────
  ids <- sort(unique(samples$sampleid))
  n   <- length(ids)

  # Construct balanced cell vector: repeat (tp x arm) combinations
  # in full blocks, then randomly permute so plates are not sorted
  cells <- expand.grid(
    timeperiod  = timeperiod_levels,
    cohort_arm  = cohort_arm_levels,
    stringsAsFactors = FALSE
  )
  n_cells    <- nrow(cells)                      # always 4
  n_full     <- n %/% n_cells                    # subjects per full block
  n_rem      <- n %% n_cells                     # remainder (0 for n = 20)

  design_vec <- cells[rep(seq_len(n_cells), times = n_full), ]
  if (n_rem > 0L)
    design_vec <- rbind(design_vec, cells[seq_len(n_rem), ])

  set.seed(seed)
  design_vec <- design_vec[sample(nrow(design_vec)), ]

  lookup <- data.frame(
    sampleid   = ids,
    timeperiod = factor(design_vec$timeperiod, levels = timeperiod_levels),
    cohort_arm = factor(design_vec$cohort_arm, levels = cohort_arm_levels),
    stringsAsFactors = FALSE
  )

  # ── Join back onto samples (row-order preserved) ────────────
  out <- samples
  out$timeperiod <- NULL
  out$cohort_arm <- NULL
  out <- merge(out, lookup, by = "sampleid", all.x = TRUE, sort = FALSE)

  # Restore original row order (merge can reorder)
  orig_key <- paste(samples$curve_id, samples$sampleid)
  new_key  <- paste(out$curve_id,     out$sampleid)
  out      <- out[match(orig_key, new_key), ]
  rownames(out) <- NULL
  out
}
