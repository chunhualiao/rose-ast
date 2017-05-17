# regular C files
# -----------------------------------------------
C_FILES = \
  func1.c \
  accumulationStmt.c

C_FILES_PDF = $(C_FILES:.c=.c.pdf) 
C_FILES_DOT = $(C_FILES:.c=.c_WholeAST.dot) 

$(C_FILES_PDF): %.c.pdf:%.c
	pdfGenerator -c $<

$(C_FILES_DOT): %.c_WholeAST.dot:%.c
	dotGeneratorWholeASTGraph -c $<


# C++ files, with C++11 features
# -----------------------------------------------
CXX_FILES = \
  lambda.cxx

CXX_FILES_PDF = $(CXX_FILES:.cxx=.cxx.pdf) 
# cannot generate C++ dot files now.
# builtin function declarations are needed to compile them.
# But with builtin functions, the AST is too large to be generated. 
# "/usr/include/bits/byteswap.h", line 47: error: identifier "__builtin_bswap32"
#           is undefined
#    return __builtin_bswap32 (__bsx);
#
#CXX_FILES_DOT = $(CXX_FILES:.cxx=.cxx_WholeAST.dot) 

$(CXX_FILES_PDF): %.cxx.pdf:%.cxx
	pdfGenerator -std=c++11 -c $<

# AST may be too large to generate dot file sometimes.
$(CXX_FILES_DOT): %.cxx_WholeAST.dot:%.cxx
	dotGeneratorWholeASTGraph -std=c++11 -c $<

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
# .f Files 
# -----------------------------------------------
F77_FILES = \
  subroutine1.f

F77_FILES_PDF = $(F77_FILES:.f=.f.pdf) 
F77_FILES_DOT = $(F77_FILES:.f=.f_WholeAST.dot) 

$(F77_FILES_PDF): %.f.pdf:%.f
	pdfGenerator -c $<

$(F77_FILES_DOT): %.f_WholeAST.dot:%.f
	dotGeneratorWholeASTGraph -c $<
 
#--------further convert dot file to pdf and pgn file------
ALL_FILES_DOT = $(C_FILES_DOT) $(OMP_C_FILES_DOT) $(CXX_FILES_DOT) $(F77_FILES_DOT)

ALL_FILES_DOT_PDF = $(ALL_FILES_DOT:.dot=.dot.pdf)
ALL_FILES_DOT_PNG = $(ALL_FILES_DOT:.dot=.dot.png)

$(ALL_FILES_DOT_PDF): %.dot.pdf:%.dot
	dot -Tpdf $< -o $@

$(ALL_FILES_DOT_PNG): %.dot.png:%.dot
	dot -Tpng $< -o $@

all: $(OMP_C_FILES_PDF) $(OMP_C_FILES_DOT) \
     $(C_FILES_PDF) $(C_FILES_DOT) \
     $(F77_FILES_PDF) $(F77_FILES_DOT) \
     $(CXX_FILES_PDF) $(CXX_FILES_DOT) \
     $(ALL_FILES_DOT_PDF) $(ALL_FILES_DOT_PNG)

clean:
	rm -rf rose_*.* *.pdf *.dot
