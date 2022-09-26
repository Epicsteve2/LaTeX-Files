#!/usr/bin/env bash
set -eu -o pipefail

## --interactive --verbose
# printf '%s\n' src/*.tex | xargs -I {} --delimiter '\n' -- pdflatex --halt-on-error --output-directory=pdf/ {}

## Better version
cd src
printf '%s\n' *.tex | xargs --max-args 1 --delimiter '\n' -- latexmk --pdf --quiet --output-directory=../pdf/
