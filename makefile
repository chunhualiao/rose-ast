# regular C files
# -----------------------------------------------
C_FILES = \
  func1.c \
  accumulationStmt.c \
  constType.c \
  typedefType.c \
  pointerArray.c \
  forLoop.c

C_FILES_PDF = $(C_FILES:.c=.c.pdf) 
C_FILES_DOT = $(C_FILES:.c=.c_WholeAST.dot) 

$(C_FILES_PDF): %.c.pdf:%.c
	source ./set.rose ; pdfGenerator -c $<

$(C_FILES_DOT): %.c_WholeAST.dot:%.c
	source ./set.rose ; dotGeneratorWholeASTGraph -c $<


# C++ files with .cpp suffix, small enough for dot graph generation
CPP_FILES = \
   autoKernel.cpp \
   arrayRefs.cpp \
   constructor.cpp

CPP_FILES_PDF = $(CPP_FILES:.cpp=.cpp.pdf) 

CPP_FILES_DOT = $(CPP_FILES:.cpp=.cpp_WholeAST.dot) 

$(CPP_FILES_PDF): %.cpp.pdf:%.cpp
	source ./set.rose ; pdfGenerator -std=c++11 -c $<

# AST may be too large to generate dot file sometimes.
$(CPP_FILES_DOT): %.cpp_WholeAST.dot:%.cpp
	source ./set.rose ; dotGeneratorWholeASTGraph -std=c++11 -c $<


# C++ files, with C++11 features, too large for dot graph generation
# Must use .cxx suffix here.
# -----------------------------------------------
CXX_FILES = \
  lambda.cxx \
  indirectLambdaCall.cxx

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
	source ./set.rose ; pdfGenerator -std=c++11 -c $<

# AST may be too large to generate dot file sometimes.
$(CXX_FILES_DOT): %.cxx_WholeAST.dot:%.cxx
	source ./set.rose ; dotGeneratorWholeASTGraph -std=c++11 -c $<

# OpenMP C files
# -----------------------------------------------
OMP_C_FILES = \
  parallelfor.c

OMP_C_FILES_PDF = $(OMP_C_FILES:.c=.c.pdf) 
OMP_C_FILES_DOT = $(OMP_C_FILES:.c=.c_WholeAST.dot) 

$(OMP_C_FILES_PDF): %.c.pdf:%.c
	source ./set.rose ; pdfGenerator -rose:OpenMP:ast_only -c $<

$(OMP_C_FILES_DOT): %.c_WholeAST.dot:%.c
	source ./set.rose ; dotGeneratorWholeASTGraph -rose:OpenMP:ast_only -c $<
# .f Files 
# -----------------------------------------------
F77_FILES = \
  subroutine1.f

F77_FILES_PDF = $(F77_FILES:.f=.f.pdf) 
F77_FILES_DOT = $(F77_FILES:.f=.f_WholeAST.dot) 

$(F77_FILES_PDF): %.f.pdf:%.f
	source ./set.rose ; pdfGenerator -c $<

$(F77_FILES_DOT): %.f_WholeAST.dot:%.f
	source ./set.rose ; dotGeneratorWholeASTGraph -c $<
 
#--------further convert dot file to pdf and pgn file------
ALL_FILES_DOT = $(C_FILES_DOT) $(OMP_C_FILES_DOT) $(CXX_FILES_DOT) $(F77_FILES_DOT) $(CPP_FILES_DOT)

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
	rm -rf *.o *.out

distclean:
	rm -rf rose_*.* *.pdf *.dot
