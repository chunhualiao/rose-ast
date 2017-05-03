# regular C files
# -----------------------------------------------
C_FILES = \
  func1.c 

C_FILES_PDF = $(C_FILES:.c=.c.pdf) 
C_FILES_DOT = $(C_FILES:.c=.c_WholeAST.dot) 

$(C_FILES_PDF): %.c.pdf:%.c
	pdfGenerator -c $<

$(C_FILES_DOT): %.c_WholeAST.dot:%.c
	dotGeneratorWholeASTGraph -c $<

# OpenMP C files
# -----------------------------------------------
OMP_C_FILES = \
  parallelfor.c

OMP_C_FILES_PDF = $(OMP_C_FILES:.c=.c.pdf) 
OMP_C_FILES_DOT = $(OMP_C_FILES:.c=.c_WholeAST.dot) 

$(OMP_C_FILES_PDF): %.c.pdf:%.c
	pdfGenerator -rose:OpenMP:ast_only -c $<

$(OMP_C_FILES_DOT): %.c_WholeAST.dot:%.c
	dotGeneratorWholeASTGraph -rose:OpenMP:ast_only -c $<
 
#--------convert dot file to pdf and pgn file------
ALL_FILES_DOT = $(C_FILES_DOT) $(OMP_C_FILES_DOT) 
ALL_FILES_DOT_PDF = $(ALL_FILES_DOT:.dot=.dot.pdf)

ALL_FILES_DOT_PNG = $(ALL_FILES_DOT:.dot=.dot.png)

$(ALL_FILES_DOT_PDF): %.dot.pdf:%.dot
	dot -Tpdf $< -o $@

$(ALL_FILES_DOT_PNG): %.dot.png:%.dot
	dot -Tpng $< -o $@

all: $(OMP_C_FILES_PDF) $(OMP_C_FILES_DOT) $(C_FILES_PDF) $(C_FILES_DOT) $(ALL_FILES_DOT_PDF) $(ALL_FILES_DOT_PNG)

clean:
	rm -rf rose_*.* *.pdf *.dot
