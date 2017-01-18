library(shiny)
library(optparse)
library(utils)

# Pandoc needs a UTF-8 locale?
Sys.setenv(LC_ALL="en_US.UTF-8")
Sys.setenv(LANG="en_US.UTF-8")
Sys.setenv(LANGUAGE="en_US.UTF-8")

option_list = list(
    make_option(c("--baseurl"), type="character", default="/",
                help="the base url", metavar="character"),
    make_option(c("--host"), type="character", default="0.0.0.0",
                help="the host ip", metavar="character"),
    make_option(c("--port"), type="integer", default=8000,
                help="the port", metavar="number")
);

opt_parser = OptionParser(option_list = option_list);
arguments = parse_args(opt_parser, positional_arguments = 1);
opt = arguments$options
app_path = arguments$args

# check to see if app is a file or directory.
# if it is a file, we assume it includes both server and ui of
# the Shiny application.
# if it is a directory, we assume it contains a server.R file
# and either ui.R or www/index.html

if (file_test("-f",app_path)) {
    # app_path is a file with a Shiny application
    app <- shinyAppFile(app_path)
} else if (file_test("-d",app_path)) {
    # app_path is a directory with a server.R and either ui.R or www/index.html
    app <- shinyAppDir(app_path)
} else {
    # invalid app_path
    app <- NULL
    cat("Invalid app_path: \"",app_path,
        "\" should be a file with a Shiny application or a directory",
        " with a server.R and either ui.R or www/index.html\n")
}

shiny::runApp(
    appDir = app,
    host=opt$host,
    port=opt$port,
    launch.browser = FALSE
)
