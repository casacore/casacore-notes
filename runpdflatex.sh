#!/bin/bash

for texfile in {191,199,216,223,224,229,233,238,255,256,259,260,262}.latex;
do
  inputsdir=$( echo $texfile | sed -e's/\.latex/\.dir/' )
  export TEXINPUTS=.:$inputsdir:
  pdflatex -output-directory=pdf $texfile
  pdflatex -output-directory=pdf $texfile
  htlatex $texfile "xhtml,mathml,fn-in" "" -d$( realpath html )/
  htlatex $texfile "xhtml,mathml,fn-in" "" -d$( realpath html )/
done
