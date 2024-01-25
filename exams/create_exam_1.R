## exams ----------------------------------------------------------------------------
options(tinytex.verbose = TRUE)
print('Running')
Sys.setenv(PATH = paste(Sys.getenv("PATH"), "/usr/share/R/share/texmf/tex/latex/Sweave.sty", sep = ":"))


## load package
library("exams")
setwd('~/Teaching/communication_and_networks/exams/')

## exam with a simple vector of exercises in R/LaTeX (.Rnw) format
## -> alternatively try a list of vectors of more exercises
myexam <- c("graph_questions.Rnw", # Includes edgelist
            "matrix.Rnw",
            "matrix.Rmd"
#            "density.Rnw",
#            "distance.Rnw",
#            "degree_centrality.Rnw",
#            "betweenness_centrality.Rnw"
##            "diameter.Rnw",
#            "centralization.Rnw",
#            "directed.Rnw",
#            "bipartite.Rnw",
#            "ASSIST.Rnw",
#            "core_discussion.Rnw",
#            "paul_revere.Rnw",
#            "six_degrees.Rnw",
#            "vector.Rnw",
#            "make_network.Rnw"
            )
## note that the currency exercise is in UTF-8 encoding


#exams2blackboard(myexam, n = 1,
#                 encoding = 'UTF-8',
#                 edir = 'exercises',
#                 name = 'midterm')
#
## exams2pdf ------------------------------------------------------------------------
## PDF output (1 file per exam)
## -> typically used for quickly checking if an exercise can be converted to PDF
## -> or customized via suitable templates

## generate the PDF version of a single exercise (shown in PDF viewer)
## with default settings
#exams2pdf("exercises/matrix.Rnw")

## generate a single PDF exam (shown in PDF viewer)
## with specification of a template (for an exam) %s encoding
#exams2pdf(myexam, n = 1,
#  encoding = "UTF-8",
#  edir = "exercises",
#  template = "templates/solution.tex")
#
### generate three PDF exams and corresponding solutions in output directory
### (with the header used to set a custom Date and ID for the exam)
exams2pdf(myexam, n = 2, name = c("pdf-exam", "pdf-solution"),
  encoding = "UTF-8",
  dir = "exam_1",
  edir = "exercises",
  template = c("templates/exam.tex", "templates/solution.tex"),
  header = list(
    Date = "2020-02-20",
    ID = function(i) formatC(i, width = 5, flag = "0")
  ))
#

## ----------------------------------------------------------------------------------
