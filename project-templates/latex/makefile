build: __PROJECT-NAME__.tex
	pdflatex __PROJECT-NAME__.tex

preview: __PROJECT-NAME__.pdf
	zathura __PROJECT-NAME__.pdf &

dev: __PROJECT-NAME__.tex
	ls *tex | entr make
