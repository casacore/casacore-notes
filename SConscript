import os

Import( ["env"])

# create a new environment to use the pdf builder to build html docs
htenv = env.Clone()
htenv["PDFLATEX"] = 'htlatex'
htenv["PDFLATEXFLAGS"] = ''
htenv["PDFSUFFIX"] = '.html'
htenv['LATEXRETRIES']  = 2

prefix = env["PREFIX"]

for srcno in ["notes", "191", "199", "216", "223", "224", 
              "229", "233", "238", "255", "256"]:
    env["TEXINPUTS"] = 'texinputs.dir:'+'notes/'+srcno+'.dir'
    htenv["TEXINPUTS"] = env["TEXINPUTS"]
    src = env.File(os.path.join("notes", srcno+".latex"))
    pdf = env.File(env.PDF(source = src))
    instpdf  = env.Install(prefix, pdf) 
    env.Alias("install", instpdf)
    # creates html
    html = htenv.PDF(source = src)
    insthtml  = htenv.Install(prefix, html)
    htmlaux = htenv.File(os.path.splitext(str(html[0]))[0]+".css")
    htenv.SideEffect(htmlaux, html)
    instaux  = htenv.Install(prefix, htmlaux) 
    htenv.Alias("install", [insthtml, instaux])
