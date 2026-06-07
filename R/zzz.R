.onAttach <- function(libname, pkgname) {

  bayes_ok   <- requireNamespace("curveRbayes",   quietly = TRUE)
  weights_ok <- requireNamespace("curveRweights",  quietly = TRUE)
  stan_ok    <- bayes_ok &&
    tryCatch({ cmdstanr::cmdstan_version(); TRUE }, error = function(e) FALSE)

  msg <- paste0(
    "\n",
    cli_rule("curveR ecosystem"),
    "\n",
    "  \u2714 curveRcore    ",
    pkg_ver("curveRcore"),
    "  \u2014 models, preprocessing, output class\n",
    "  \u2714 curveRfreq    ",
    pkg_ver("curveRfreq"),
    "  \u2014 frequentist NLS calibration\n",
    if (bayes_ok)
      paste0("  \u2714 curveRbayes   ", pkg_ver("curveRbayes"),
             "  \u2014 Bayesian hierarchical calibration\n")
    else
      "  \u2717 curveRbayes   [not installed]\n",
    if (weights_ok)
      paste0("  \u2714 curveRweights ", pkg_ver("curveRweights"),
             "  \u2014 continuous precision weighting\n")
    else
      "  \u2717 curveRweights  [not installed]\n"
  )

  if (!stan_ok) {
    msg <- paste0(
      msg,
      "\n  Stan components require CmdStan:\n",
      "    install.packages('cmdstanr',\n",
      "      repos = c('https://stan-dev.r-universe.dev', getOption('repos')))\n",
      "    cmdstanr::install_cmdstan()\n"
    )
  }

  msg <- paste0(msg, "\n  Docs: https://immunoplex.github.io/curveR/\n")

  packageStartupMessage(msg)
}

pkg_ver <- function(pkg) {
  v <- tryCatch(as.character(utils::packageVersion(pkg)), error = function(e) "?")
  formatC(paste0("v", v), width = 9, flag = "-")
}

cli_rule <- function(title) {
  width <- max(getOption("width", 80L), 40L)
  pad   <- max(0L, width - nchar(title) - 4L)
  paste0("\u2500\u2500 ", title, " ", strrep("\u2500", pad))
}
