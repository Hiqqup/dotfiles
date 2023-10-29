#!/bin/bash
rm e.tex -i
lowdown -s -tlatex --parse-math $1 >> e.tex 
pdflatex e.tex
