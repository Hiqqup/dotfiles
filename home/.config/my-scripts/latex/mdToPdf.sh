#!/bin/bash
lowdown -s -tlatex --parse-math $1 > /tmp/e.tex && pdflatex /tmp/e.tex

# lowdown -s -tlatex --parse-math Restklassen.md > /tmp/e.tex && pdflatex -output-directory=/tmp /tmp/e.tex && zathura /tmp/e.pdf
