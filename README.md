# rose-ast
A repository storing sample C, C++ programs and their corresponding AST graphs.

For example, func1.c has the following AST dump files.
* PDF file dump using structured bookmarks : func1.c.pdf  
* DOT file dump using dot graph            : func1.c_WholeAST.dot  
* PDF file converted from DOT graph        : func1.c_WholeAST.dot.pdf
* PNG file converted from DOT graph        : func1.c_WholeAST.dot.png

To view those files, you can try to use
* xdg-open file.pdf
* xdg-open file.png
* zgrviewer-0.8.2/run.sh file.dot

To regenerate all the pdf and dot graphs
1. Install ROSE
2. edit set.rose to point to the right path of ROSE installation
3. type make clean && make all

