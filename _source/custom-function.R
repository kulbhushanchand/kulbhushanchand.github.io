custom_knit <- function(inputFile, encoding) {
  knitr::knit(inputFile, output = paste0('../_posts/',stringr::str_remove_all(inputFile, paste0(here::here(), '|', "/_source/", '|', "\\.Rmd")), '.md'));
  l = knitr::knit_meta();
  dep_dir = stringr::str_c(stringr::str_remove_all(here::here(), "/_source"),'/assets/htmlwidgets_deps');
  base_path = stringr::str_c(stringr::str_remove_all(here::here(), "/_source"),'/');
  includes_dir = "_includes/htmlwidgets/";
  hrefFilter = function(x) {paste0("/", x)};
  if (length(l) > 0) {dir.create(dep_dir, showWarnings = FALSE, recursive = TRUE)};
  l <- lapply(unique(l), function(dep) {
    dep <- htmltools::copyDependencyToDir(dep, dep_dir, FALSE);
    dep <- htmltools::makeDependencyRelative(dep, base_path, FALSE);
    dep } );
  l <- htmltools::renderDependencies(l,  hrefFilter=hrefFilter);
  render_markdown();
  prev_doc_hook <- knitr::knit_hooks$get("document");
  knitr::knit_hooks$set(document = function(x) {prev_doc_hook(append(x, l))});
  knitr::knit(inputFile, output = paste0('../_posts/',stringr::str_remove_all(inputFile, paste0(here::here(), '|', "/_source/", '|', "\\.Rmd")), '.md'))
}