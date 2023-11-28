all: 191.html 185.html 185.pdf 199.html 216.html 223.html 224.html 229.html 233.html 238.html 255.html 256.html 259.html 260.html 262.html 263.html 264.html 262.pdf 191.pdf 199.pdf 216.pdf 223.pdf 224.pdf 229.pdf 233.pdf 238.pdf 255.pdf 256.pdf 259.pdf 260.pdf 262.pdf 263.pdf 264.pdf 265.pdf

%.pdf: %.latex
	export TEXINPUTS=.:$*.dir/: && \
	pdflatex $< && \
	pdflatex $<

%.html: %.latex
	export TEXINPUTS=.:$*.dir/: && \
	htlatex $< "xhtml,mathml,fn-in,css-in, charset=utf-8" " -cunihtf -utf8" && \
	htlatex $< "xhtml,mathml,fn-in,css-in, charset=utf-8" " -cunihtf -utf8" && \
	if [ "$<" = "263.latex" ]; then sed -i.bak "s/\"\(.*\).png/\"263.dir\/\1.png/" 263.html; fi
