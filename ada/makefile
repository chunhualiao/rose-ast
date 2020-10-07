# Must set this to use source command
SHELL := /bin/bash
# regular C files
# -----------------------------------------------
#  Based on the list of PASSTING_TESTS from
# https://github.com/rose-compiler/rose/blob/develop/tests/nonsmoke/functional/CompileTests/experimental_ada_tests/Makefile.am
#  pkgrename.ads
#  named.ads
#  opaque.ads
#  parent-child.ads
ADA_FILES = \
  variable_declaration.ads             \
  constant_declaration.ads             \
  derived_record.ads                   \
  empty_package.ads                    \
  entry_declaration.ads                \
  exception_declaration.ads            \
  gototest.ads                         \
  nested_package.ads                   \
  ordinary_type_declaration.ads        \
  package_with_body.ads                \
  selected_component.ads               \
  simple_expression_range.ads          \
  tagged_definition.ads                \
  task_type_declaration.ads            \
  task_with_body.ads                   \
  test_unit.ads                        \
  test.ads                             \
  unit_2.ads

ADA_FILES_TXT = $(ADA_FILES:.ads=.ads.AST.txt) 
ADA_FILES_PDF = $(ADA_FILES:.ads=.ads.pdf) 
#ADA_FILES_DOT = $(ADA_FILES:.ads=.ads_WholeAST.dot) 
ADA_FILES_DOT = $(ADA_FILES:.ads=.ads.dot) 

$(ADA_FILES_TXT): %.ads.AST.txt:%.ads
	source ./set.rose ; textASTGenerator -c $<

$(ADA_FILES_PDF): %.ads.pdf:%.ads
	source ./set.rose ; pdfGenerator -c $<

$(ADA_FILES_DOT): %.ads.dot:%.ads
	source ./set.rose ; dotGeneratorWholeASTGraph -c $<

#--------further convert dot file to pdf and pgn file------
ALL_FILES_DOT = $(ADA_FILES_DOT) 

ALL_FILES_DOT_PDF = $(ALL_FILES_DOT:.dot=.dot.pdf)
ALL_FILES_DOT_PNG = $(ALL_FILES_DOT:.dot=.dot.png)

$(ALL_FILES_DOT_PDF): %.dot.pdf:%.dot
	dot -Tpdf $< -o $@

$(ALL_FILES_DOT_PNG): %.dot.png:%.dot
	dot -Tpng $< -o $@

all: $(ADA_FILES_PDF) $(ADA_FILES_DOT) $(ADA_FILES_TXT) \
     $(ALL_FILES_DOT_PDF) $(ALL_FILES_DOT_PNG)

clean:
	rm -rf *.o *.out

distclean:
	rm -rf rose_*.* *.pdf *.dot