#! /bin/sh

# Find the files that are named like week_n.Rmd and copy them to lectures/class_lectures/

# Find the files
find . -name "week_*.Rmd" -exec cp {} lectures/class_lectures/ \;

# Find the other files 