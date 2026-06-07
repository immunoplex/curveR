# Package index

## curveR: bead_assay adding timeperiod cohort_arm

Generate design variables for the example data.

- [`add_bead_assay_design()`](https://immunoplex.github.io/curveR/reference/add_bead_assay_design.md)
  :

  Add study design columns to `bead_assay_example` samples

- [`curveR-package`](https://immunoplex.github.io/curveR/reference/curveR-package.md)
  [`curveR`](https://immunoplex.github.io/curveR/reference/curveR-package.md)
  : curveR: Calibration Curve Ecosystem for Quantitative Immunoassays

## curveRcore: Forward models

Five canonical sigmoidal forward model functions shared across all
fitting engines.

- [`logistic4()`](https://immunoplex.github.io/curveRcore/reference/logistic4.html)
  : Four-Parameter Logistic (4PL) Forward Function (from curveRcore)
- [`logistic5()`](https://immunoplex.github.io/curveRcore/reference/logistic5.html)
  : Five-Parameter Logistic (5PL) Forward Function (from curveRcore)
- [`loglogistic4()`](https://immunoplex.github.io/curveRcore/reference/loglogistic4.html)
  : Four-Parameter Log-Logistic (Dose-Response) Forward Function (from
  curveRcore)
- [`loglogistic5()`](https://immunoplex.github.io/curveRcore/reference/loglogistic5.html)
  : Five-Parameter Generalised Logistic (Richards) Forward Function
  (from curveRcore)
- [`gompertz4()`](https://immunoplex.github.io/curveRcore/reference/gompertz4.html)
  : Four-Parameter Gompertz Forward Function (from curveRcore)
- [`available_models()`](https://immunoplex.github.io/curveRcore/reference/available_models.html)
  : List all available model names (from curveRcore)
- [`model_params()`](https://immunoplex.github.io/curveRcore/reference/model_params.html)
  : Model registry: parameter names for each model family (from
  curveRcore)
- [`build_nls_formulas()`](https://immunoplex.github.io/curveRcore/reference/build_nls_formulas.html)
  : Build NLS Formulas for Candidate Models (from curveRcore)

## curveRcore: Inverses

Analytical back-calculation functions for all five models.

- [`inv_logistic4()`](https://immunoplex.github.io/curveRcore/reference/inv_logistic4.html)
  [`inv_logistic4_fixed()`](https://immunoplex.github.io/curveRcore/reference/inv_logistic4.html)
  : Inverse of the 4PL Model (from curveRcore)
- [`inv_logistic5()`](https://immunoplex.github.io/curveRcore/reference/inv_logistic5.html)
  [`inv_logistic5_fixed()`](https://immunoplex.github.io/curveRcore/reference/inv_logistic5.html)
  : Inverse of the 5PL Model (from curveRcore)
- [`inv_loglogistic4()`](https://immunoplex.github.io/curveRcore/reference/inv_loglogistic4.html)
  [`inv_loglogistic4_fixed()`](https://immunoplex.github.io/curveRcore/reference/inv_loglogistic4.html)
  : Inverse of the loglogistic4 Model (from curveRcore)
- [`inv_loglogistic5()`](https://immunoplex.github.io/curveRcore/reference/inv_loglogistic5.html)
  [`inv_loglogistic5_fixed()`](https://immunoplex.github.io/curveRcore/reference/inv_loglogistic5.html)
  : Inverse of the loglogistic5 Model (from curveRcore)
- [`inv_gompertz4()`](https://immunoplex.github.io/curveRcore/reference/inv_gompertz4.html)
  [`inv_gompertz4_fixed()`](https://immunoplex.github.io/curveRcore/reference/inv_gompertz4.html)
  : Inverse of the Gompertz Model (from curveRcore)

## curveRcore: Derivatives and gradients

First and second derivatives plus analytical gradient closures used for
delta-method uncertainty propagation.

- [`dydx_logistic4()`](https://immunoplex.github.io/curveRcore/reference/dydx_logistic4.html)
  : First Derivative of the 4PL Model (from curveRcore)
- [`dydx_logistic5()`](https://immunoplex.github.io/curveRcore/reference/dydx_logistic5.html)
  : First Derivative of the 5PL Model (from curveRcore)
- [`dydx_loglogistic4()`](https://immunoplex.github.io/curveRcore/reference/dydx_loglogistic4.html)
  : First Derivative of the loglogistic4 Model (from curveRcore)
- [`dydx_loglogistic5()`](https://immunoplex.github.io/curveRcore/reference/dydx_loglogistic5.html)
  : First Derivative of the loglogistic5 Model (from curveRcore)
- [`dydx_gompertz4()`](https://immunoplex.github.io/curveRcore/reference/dydx_gompertz4.html)
  : First Derivative of the Gompertz Model (from curveRcore)
- [`d2x_logistic4()`](https://immunoplex.github.io/curveRcore/reference/d2x_logistic4.html)
  : Second Derivative of the 4PL Model (from curveRcore)
- [`d2x_logistic5()`](https://immunoplex.github.io/curveRcore/reference/d2x_logistic5.html)
  : Second Derivative of the 5PL Model (Numerical) (from curveRcore)
- [`d2x_loglogistic4()`](https://immunoplex.github.io/curveRcore/reference/d2x_loglogistic4.html)
  : Second Derivative of the loglogistic4 Model (Numerical) (from
  curveRcore)
- [`d2x_loglogistic5()`](https://immunoplex.github.io/curveRcore/reference/d2x_loglogistic5.html)
  : Second Derivative of the loglogistic5 Model (Numerical) (from
  curveRcore)
- [`d2x_gompertz4()`](https://immunoplex.github.io/curveRcore/reference/d2x_gompertz4.html)
  : Second Derivative of the Gompertz Model (from curveRcore)
- [`grad_logistic4()`](https://immunoplex.github.io/curveRcore/reference/grad_logistic4.html)
  : Analytical Gradient of the Inverse 4PL (from curveRcore)
- [`grad_logistic5()`](https://immunoplex.github.io/curveRcore/reference/grad_logistic5.html)
  : Analytical Gradient of the Inverse 5PL (from curveRcore)
- [`grad_loglogistic4()`](https://immunoplex.github.io/curveRcore/reference/grad_loglogistic4.html)
  : Analytical Gradient of the Inverse loglogistic4 (from curveRcore)
- [`grad_loglogistic5()`](https://immunoplex.github.io/curveRcore/reference/grad_loglogistic5.html)
  : Analytical Gradient of the Inverse loglogistic5 (from curveRcore)
- [`grad_gompertz4()`](https://immunoplex.github.io/curveRcore/reference/grad_gompertz4.html)
  : Analytical Gradient of the Inverse Gompertz (from curveRcore)
- [`make_inv_and_grad_fixed()`](https://immunoplex.github.io/curveRcore/reference/make_inv_and_grad_fixed.html)
  : Build Inverse, Gradient, and grad_y Closures for a Model (from
  curveRcore)

## curveRcore: Preprocessing and transforms

The preprocessing pipeline applied upstream of both fitting packages.

- [`preprocess_standards()`](https://immunoplex.github.io/curveRcore/reference/preprocess_standards.html)
  : Full Preprocessing Pipeline for Standard Curve Data (from
  curveRcore)
- [`compute_concentration()`](https://immunoplex.github.io/curveRcore/reference/compute_concentration.html)
  : Compute Concentration from Dilution and Undiluted Standard (from
  curveRcore)
- [`compute_log_response()`](https://immunoplex.github.io/curveRcore/reference/compute_log_response.html)
  : Log10-Transform the Assay Response (from curveRcore)
- [`correct_prozone()`](https://immunoplex.github.io/curveRcore/reference/correct_prozone.html)
  : Correct the Prozone (Hook) Effect (from curveRcore)
- [`perform_blank_operation()`](https://immunoplex.github.io/curveRcore/reference/perform_blank_operation.html)
  : Apply a Blank Operation to Standard Curve Data (from curveRcore)
- [`resolve_fixed_lower_asymptote()`](https://immunoplex.github.io/curveRcore/reference/resolve_fixed_lower_asymptote.html)
  : Resolve the Fixed Lower Asymptote Value (from curveRcore)
- [`adaptive_constraint_profile()`](https://immunoplex.github.io/curveRcore/reference/adaptive_constraint_profile.html)
  : Build an Adaptive Constraint Profile from Observed Data (from
  curveRcore)
- [`validate_fixed_lower_asymptote()`](https://immunoplex.github.io/curveRcore/reference/validate_fixed_lower_asymptote.html)
  : Validate a Fixed Lower Asymptote Before Log Transformation (from
  curveRcore)

## curveRcore: Settings and configuration

Constructor functions for fit settings objects.

- [`new_antigen_constraints()`](https://immunoplex.github.io/curveRcore/reference/new_antigen_constraints.html)
  : Create Antigen-Level Constraint Settings (from curveRcore)
- [`new_fit_options()`](https://immunoplex.github.io/curveRcore/reference/new_fit_options.html)
  : Create Model Fitting and Grid Options (from curveRcore)
- [`new_study_params()`](https://immunoplex.github.io/curveRcore/reference/new_study_params.html)
  : Create Study-Level Fitting Parameters (from curveRcore)
- [`resolve_effective_models()`](https://immunoplex.github.io/curveRcore/reference/resolve_effective_models.html)
  : Resolve Effective Models for a Given Configuration (from curveRcore)
- [`resolve_response_col()`](https://immunoplex.github.io/curveRcore/reference/resolve_response_col.html)
  : Resolve the Response Column Name (from curveRcore)

## curveRcore: Output class and extractors

The shared `calibration_result` S3 class and tidy-style extractors. Both
fitting packages return objects of this class so downstream code is
engine-agnostic.

- [`new_calibration_result()`](https://immunoplex.github.io/curveRcore/reference/new_calibration_result.html)
  : Construct a Calibration Result Object (from curveRcore)
- [`new_calibration_result_multiplate()`](https://immunoplex.github.io/curveRcore/reference/new_calibration_result_multiplate.html)
  : Construct a Multi-Plate Calibration Result (from curveRcore)
- [`tidy_samples()`](https://immunoplex.github.io/curveRcore/reference/tidy_samples.html)
  : Tidy the per-sample predictions from a calibration result (from
  curveRcore)
- [`tidy_grid()`](https://immunoplex.github.io/curveRcore/reference/tidy_grid.html)
  : Tidy the precision grid from a calibration result (from curveRcore)
- [`pcov_from_se()`](https://immunoplex.github.io/curveRcore/reference/pcov_se_conversion.html)
  [`se_from_pcov()`](https://immunoplex.github.io/curveRcore/reference/pcov_se_conversion.html)
  : Convert between posterior CV (pcov) and the log10-scale
  concentration SD (from curveRcore)
- [`compare_calibrations()`](https://immunoplex.github.io/curveRcore/reference/compare_calibrations.html)
  : Compare Two Calibration Results (Grid Predictions) (from curveRcore)
- [`compare_parameters()`](https://immunoplex.github.io/curveRcore/reference/compare_parameters.html)
  : Compare Parameters Between Two Calibration Results (from curveRcore)
- [`compare_samples()`](https://immunoplex.github.io/curveRcore/reference/compare_samples.html)
  : Compare Sample Predictions Between Two Calibration Results (from
  curveRcore)
- [`agreement_metrics()`](https://immunoplex.github.io/curveRcore/reference/agreement_metrics.html)
  : Compute Agreement Metrics Between Paired Predictions (from
  curveRcore)

## curveRcore: Eligibility gating and model selection

Four-gate eligibility check applied identically by both fitting packages
before AIC or LOO-CV selection.

- [`assess_model_eligibility()`](https://immunoplex.github.io/curveRcore/reference/assess_model_eligibility.html)
  : Assess Model Eligibility for Quantification (from curveRcore)
- [`select_best_eligible()`](https://immunoplex.github.io/curveRcore/reference/select_best_eligible.html)
  : Select the Best Eligible Model (from curveRcore)

## curveRcore: Detection and quantification limits

LOD, MDC, RDL, shape-based LLOQ/ULOQ, and CDAN precision grids.

- [`compute_detection_limits()`](https://immunoplex.github.io/curveRcore/reference/compute_detection_limits.html)
  : Compute and attach detection limits to a calibration_result (from
  curveRcore)
- [`compute_detection_limits_multiplate()`](https://immunoplex.github.io/curveRcore/reference/compute_detection_limits_multiplate.html)
  : Compute detection limits for all plates in a multiplate result (from
  curveRcore)
- [`compute_shape_loq_from_grid()`](https://immunoplex.github.io/curveRcore/reference/compute_shape_loq_from_grid.html)
  : Compute curvature-based (shape) LOQs from an enriched grid (from
  curveRcore)
- [`enrich_grid_with_d2y()`](https://immunoplex.github.io/curveRcore/reference/enrich_grid_with_d2y.html)
  : Add a d2y_dx2 column to an existing prediction grid (from
  curveRcore)
- [`generate_prediction_grid()`](https://immunoplex.github.io/curveRcore/reference/generate_prediction_grid.html)
  : Generate a Prediction Grid of Concentrations (from curveRcore)
- [`compute_curve_ci()`](https://immunoplex.github.io/curveRcore/reference/compute_curve_ci.html)
  : Compute Confidence Interval for Fitted Curve (from curveRcore)
- [`predict_grid_response()`](https://immunoplex.github.io/curveRcore/reference/predict_grid_response.html)
  : Compute Predicted Response for a Grid (from curveRcore)

## curveRfreq: Calibration fitting

Frequentist multi-start Levenberg–Marquardt NLS calibration.
[`fit_calibration_freq_multiplate()`](https://immunoplex.github.io/curveRfreq/reference/fit_calibration_freq_multiplate.html)
is the primary entry point.

- [`fit_calibration_freq()`](https://immunoplex.github.io/curveRfreq/reference/fit_calibration_freq.html)
  : Fit a Frequentist Calibration Curve (Single Curve) (from curveRfreq)
- [`fit_calibration_freq_multiplate()`](https://immunoplex.github.io/curveRfreq/reference/fit_calibration_freq_multiplate.html)
  : Fit Frequentist Calibration Curves Across Multiple Curves (from
  curveRfreq)
- [`fit_ensemble_nls()`](https://immunoplex.github.io/curveRfreq/reference/fit_ensemble_nls.html)
  : Fit Ensemble of NLS Models for One Plate (from curveRfreq)
- [`generate_start_lists()`](https://immunoplex.github.io/curveRfreq/reference/generate_start_lists.html)
  : Generate Multi-Start Lists for NLS Fitting (from curveRfreq)
- [`compute_model_constraints()`](https://immunoplex.github.io/curveRfreq/reference/compute_model_constraints.html)
  : Compute Parameter Bounds for All Candidate Models (from curveRfreq)

## curveRfreq: Model selection and prediction

AIC ranking, best-parameter extraction, and uncertainty propagation.

- [`summarise_ensemble()`](https://immunoplex.github.io/curveRfreq/reference/summarise_ensemble.html)
  : Summarise Ensemble Fit Statistics (from curveRfreq)
- [`extract_best_parameters()`](https://immunoplex.github.io/curveRfreq/reference/extract_best_parameters.html)
  : Extract Parameters from the Best Fit (from curveRfreq)
- [`select_best_aic()`](https://immunoplex.github.io/curveRfreq/reference/select_best_aic.html)
  : Select the Best Model by AIC (from curveRfreq)
- [`predict_grid_freq()`](https://immunoplex.github.io/curveRfreq/reference/predict_grid_freq.html)
  : Predict Grid with Uncertainty (Frequentist) (from curveRfreq)
- [`predict_samples_freq()`](https://immunoplex.github.io/curveRfreq/reference/predict_samples_freq.html)
  : Predict Concentration for Test Samples (from curveRfreq)

## curveRfreq: Multi-curve helpers

Tidy extractors for multiplate calibration results.

- [`summary_table()`](https://immunoplex.github.io/curveRfreq/reference/summary_table.html)
  : Extract a Combined Summary Table from Multi-Curve Results (from
  curveRfreq)
- [`collect_samples()`](https://immunoplex.github.io/curveRfreq/reference/collect_samples.html)
  : Extract All Sample Predictions from Multi-Curve Results (from
  curveRfreq)

## curveRbayes: Calibration fitting

Bayesian hierarchical calibration via Stan. All curve_id values are
fitted simultaneously in a single hierarchical model.

- [`fit_calibration_bayes()`](https://rdrr.io/pkg/curveRbayes/man/fit_calibration_bayes.html)
  : Fit Bayesian Hierarchical Calibration Curves (from curveRbayes)
- [`compile_stan_model()`](https://rdrr.io/pkg/curveRbayes/man/compile_stan_model.html)
  : Compile a curveRbayes Stan Model (Cached) (from curveRbayes)
- [`fit_bayes_single()`](https://rdrr.io/pkg/curveRbayes/man/fit_bayes_single.html)
  : Fit a Single Model Family via MCMC (from curveRbayes)
- [`extract_curve_params()`](https://rdrr.io/pkg/curveRbayes/man/extract_curve_params.html)
  : Extract Curve-Level Posterior Summaries (from curveRbayes)

## curveRbayes: Stan data and priors

Data preparation for Stan and data-adaptive weakly informative
hyperprior construction.

- [`build_stan_data()`](https://rdrr.io/pkg/curveRbayes/man/build_stan_data.html)
  : Build Stan Data List for a Model Family (from curveRbayes)
- [`compute_dynamic_priors()`](https://rdrr.io/pkg/curveRbayes/man/compute_dynamic_priors.html)
  : Compute Data-Adaptive Priors for Stan Models (from curveRbayes)

## curveRbayes: LOO-CV model selection

PSIS-LOO cross-validation and Bayesian stacking weights.

- [`compute_loo()`](https://rdrr.io/pkg/curveRbayes/man/compute_loo.html)
  : Compute LOO-CV for a Fitted Bayesian Model (from curveRbayes)
- [`compare_models_loo()`](https://rdrr.io/pkg/curveRbayes/man/compare_models_loo.html)
  : Compare Models via LOO-CV and Stacking Weights (from curveRbayes)

## curveRbayes: Posterior prediction and CDAN precision

Posterior predictive grid (CDAN three-step procedure) and test-sample
back-calculation.

- [`predict_grid_bayes()`](https://rdrr.io/pkg/curveRbayes/man/predict_grid_bayes.html)
  : Predict Grid Response from Posterior Draws (Bayesian, CDAN) (from
  curveRbayes)
- [`predict_samples_bayes()`](https://rdrr.io/pkg/curveRbayes/man/predict_samples_bayes.html)
  : Back-Calculate Sample Concentrations from Posterior Draws (from
  curveRbayes)

## curveRbayes: Multi-curve helpers

Tidy extractors for multiplate Bayesian calibration results.

- [`summary_table_bayes()`](https://rdrr.io/pkg/curveRbayes/man/summary_table_bayes.html)
  : Extract a Per-Curve Summary Table from Bayesian Results (from
  curveRbayes)
- [`collect_samples_bayes()`](https://rdrr.io/pkg/curveRbayes/man/collect_samples_bayes.html)
  : Collect All Sample Predictions from Bayesian Results (from
  curveRbayes)

## curveRweights: curveR ecosystem entry points

The recommended API for users coming from curveRfreq or curveRbayes.
Convert calibration results to weight inputs, estimate phi and beta1,
apply weights to new data, and join weights back onto sample frames.

- [`as_weight_data()`](https://immunoplex.github.io/curveRweights/reference/as_weight_data.html)
  : Build precision-weight input from a curveR calibration result (from
  curveRweights)
- [`fit_precision_weights()`](https://immunoplex.github.io/curveRweights/reference/fit_precision_weights.html)
  : Estimate precision weights from a curveR calibration result (from
  curveRweights)
- [`predict_weights()`](https://immunoplex.github.io/curveRweights/reference/predict_weights.html)
  : Apply fitted precision weights to new observations (from
  curveRweights)
- [`join_weights()`](https://immunoplex.github.io/curveRweights/reference/join_weights.html)
  : Join estimated weights back onto a data frame (from curveRweights)

## curveRweights: Core fitting and diagnostics

The joint Bayesian location-scale model and supporting diagnostics.

- [`fit_saturated_weight()`](https://immunoplex.github.io/curveRweights/reference/fit_saturated_weight.html)
  : Fit a Bayesian Location-Scale Model with Saturated Location and
  Shared Scale (from curveRweights)
- [`fit_saturated_weight_batch()`](https://immunoplex.github.io/curveRweights/reference/fit_saturated_weight_batch.html)
  : Fit Saturated Weight Models Across Multiple Groups (from
  curveRweights)
- [`apply_saturated_weights()`](https://immunoplex.github.io/curveRweights/reference/apply_saturated_weights.html)
  : Apply Previously Estimated Scale Parameters to New Data (from
  curveRweights)
- [`compute_saturated_weights()`](https://immunoplex.github.io/curveRweights/reference/compute_saturated_weights.html)
  : Compute Precision Weights from Estimated Scale Parameters (from
  curveRweights)
- [`weight_diagnostics()`](https://immunoplex.github.io/curveRweights/reference/weight_diagnostics.html)
  : Compute Summary Diagnostics for Precision Weights (from
  curveRweights)
- [`prepare_cv()`](https://immunoplex.github.io/curveRweights/reference/prepare_cv.html)
  : Prepare the Precision Index from Calibration Curve Output (from
  curveRweights)
- [`diagnose_cv()`](https://immunoplex.github.io/curveRweights/reference/diagnose_cv.html)
  : Diagnose Precision Index Variation for Scale Estimation (from
  curveRweights)
- [`interpret_beta1()`](https://immunoplex.github.io/curveRweights/reference/interpret_beta1.html)
  : Interpret the Estimated Beta1 Value (from curveRweights)
