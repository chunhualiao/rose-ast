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
ADS_FILES = \
all_modes.ads \
case_function.ads \
comm.ads \
complex.ads \
component_declaration.ads \
constant_declaration.ads \
constants.ads \
constants-v2.ads \
constants-v3.ads \
constants-v4.ads \
derived_record.ads \
empty_package.ads \
entry_declaration.ads \
enum_colors.ads \
exception_declaration.ads \
exception_rename.ads \
function_declaration.ads \
gototest.ads \
myarrays.ads \
myarraysv1.ads \
mytype.ads \
mytype_2.ads \
mytype_array.ads \
mytype_3_array.ads \
mpi.ads \
mpiuse.ads \
named.ads \
nested_package.ads \
opaque.ads \
ordinary_type_declaration.ads \
package_with_body.ads \
parameter_declaration.ads \
parent.ads \
parent-child.ads \
pkgrename.ads \
procedure_declaration.ads \
real_typedecl.ads \
selected_component.ads \
sender.ads \
simpleada.ads \
simple_expression_range.ads \
some_modes.ads \
subtypes.ads \
tagged_definition.ads \
task_type_declaration.ads \
task_with_body.ads \
test.ads \
test_unit.ads \
unit_2.ads \
unit_3.ads \
variable_declaration.ads \
week1.ads

ADB_FILES = \
array1d.adb \
accept_statement.adb \
array_aggregate.adb \
array_declare_1.adb \
array_declare_2.adb \
block_statement.adb \
case_function.adb \
case_statement.adb \
choice_parameter_specification.adb \
complex.adb \
delay_relative.adb \
delay_until.adb \
demo_scalar.adb \
demo_myarray1.adb \
demo_myarray3.adb \
demo_myarrays3_1.adb \
demo_range1.adb \
entry_call.adb \
exit_statement.adb \
fib.adb \
for_loop.adb \
for_loop_reverse.adb \
for_loop_statement.adb \
function_call.adb \
function_declaration.adb \
goto_loop.adb \
gototest.adb \
hello_world.adb \
if_statement.adb \
increment.adb \
iterate_range.adb \
loop_exit.adb \
loop_exit_while.adb \
loop_statement.adb \
minimal.adb \
myarrays1d.adb \
myarrays.adb \
my2darrays.adb \
operator.adb \
package_with_body.adb \
procedure_call.adb \
procedure_declaration.adb \
raise_statement.adb \
recursive_call.adb \
scopequal_v2.adb \
short_circuit.adb \
task_with_body.adb \
test.adb \
test_unit.adb \
type_conversion.adb \
unit_1.adb \
unit_2.adb \
while_loop_statement.adb


ADS_FILES_TXT = $(ADS_FILES:.ads=.ads.AST.txt) 
ADB_FILES_TXT = $(ADB_FILES:.adb=.adb.AST.txt) 

ADS_FILES_PDF = $(ADS_FILES:.ads=.ads.pdf) 
#ADS_FILES_DOT = $(ADS_FILES:.ads=.ads_WholeAST.dot) 
ADS_FILES_DOT = $(ADS_FILES:.ads=.ads.dot) 
ADB_FILES_DOT = $(ADB_FILES:.adb=.adb.dot) 

%.dot.pdf:%.dot
	dot -Tpdf $< -o $@
$(ADS_FILES_TXT): %.ads.AST.txt:%.ads
	source ./set.rose ; textASTGenerator -c $<

$(ADB_FILES_TXT): %.adb.AST.txt:%.adb
	source ./set.rose ; textASTGenerator -c $<

#$(ADS_FILES_PDF): %.ads.pdf:%.ads
#	source ./set.rose ; pdfGenerator -c $<

$(ADS_FILES_DOT): %.ads.dot:%.ads
	source ./set.rose ; dotGeneratorWholeASTGraph -c $<
$(ADB_FILES_DOT): %.adb.dot:%.adb
	source ./set.rose ; dotGeneratorWholeASTGraph -c $<

#--------further convert dot file to pdf and pgn file------
ALL_FILES_DOT = $(ADS_FILES_DOT) $(ADB_FILES_DOT)

ALL_FILES_DOT_PDF = $(ALL_FILES_DOT:.dot=.dot.pdf)
ALL_FILES_DOT_PNG = $(ALL_FILES_DOT:.dot=.dot.png)

$(ALL_FILES_DOT_PDF): %.dot.pdf:%.dot
	dot -Tpdf $< -o $@

$(ALL_FILES_DOT_PNG): %.dot.png:%.dot
	dot -Tpng $< -o $@
all-txt: $(ADS_FILES_TXT)
all: $(ADS_FILES_DOT) $(ADS_FILES_TXT) \
     $(ALL_FILES_DOT_PDF) $(ALL_FILES_DOT_PNG)

clean:
	rm -rf *.o *.out

distclean:
	rm -rf rose_*.* *.pdf *.dot
