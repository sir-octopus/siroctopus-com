#!/bin/sh
# Make a quick build to be indexed
hugo
# Index it
npm_config_yes=true npx pagefind --site "public" --output-subdir ../static/pagefind
# Serve dev site (NB: Content changes will not be reflected in search until re-run)
hugo server --bind "0.0.0.0"