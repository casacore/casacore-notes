import os
import  glob
Import( ["env"])

# create a new environment to use the pdf builder to build html docs
htenv = env.Clone()
htenv["PDFLATEX"] = 'htlatex'
htenv["PDFLATEXFLAGS"] = ''
htenv["PDFSUFFIX"] = '.html'
htenv['LATEXRETRIES']  = 2

prefix = env["PREFIX"]

for srcno in ["notes", "191", "199", "216", "223", "224", "229", "233", "238",
              "255", "256"]:
    env["TEXINPUTS"] = 'texinputs.dir:'+'notes/'+srcno+'.dir'
    htenv["TEXINPUTS"] = env["TEXINPUTS"]
    src = env.File(os.path.join("notes", srcno+".latex"))
    pdf = env.PDF(source = src)
    env.Alias("build", pdf)
    instpdf  = env.Install(prefix, pdf) 
    env.Alias("install", instpdf)
    # creates html
    html = htenv.PDF(source = src)
    htenv.Alias("build", html)
    env.Default("build")
    insthtml  = htenv.Install(prefix, html)
    htmlaux = htenv.File(os.path.splitext(str(html[0]))[0]+".css")
    aux = []
    for ext in ["4ct", "4tc", "idv", "lg", "tmp", "xref", "dvi"]:
        aux.append(htenv.File(os.path.splitext(str(html[0]))[0]+"."+ext))
    htenv.SideEffect(htmlaux, html)
    # for cleaning purposes
    htenv.SideEffect(aux, html)
    instaux = htenv.Install(prefix, htmlaux)
    htmlpng = htenv.Glob("notes/%s*.png" % srcno)    
    htenv.SideEffect(htmlpng, html)
    instpng = htenv.Install(prefix, htmlpng)
    htenv.Alias("install", [instpng, insthtml, instaux])
    if srcno == "notes":
        indexhtml = htenv.InstallAs(os.path.join(prefix, "index.html"), html)
        htenv.Alias("install", indexhtml)
