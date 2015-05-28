#!/bin/bash

for texfile in *.latex;
do
  inputsdir=$( echo $texfile | sed -e's/\.latex/\.dir/' )
  export TEXINPUTS=.:$( realpath $inputsdir ):
  pdflatex $texfile
  pdflatex $texfile
done
