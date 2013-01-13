
%name Parser
%define LSP_NEEDED
%define MEMBERS \
          virtual ~Parser() {} \
          private: \
                yyFlexLexer lexer;
%define LEX_BODY {return lexer.yylex();}
%define ERROR_BODY {cerr << "error encountered at line: "<<lexer.lineno()<<"last word parsed:"<<lexer.YYText()<<"\n";}


%header{
#include <iostream>
#include <fstream>
#include <FlexLexer.h>
#include <stdlib.h>
using namespace std;
%}


%union {
                int i_type;
}




%token VAR_BINDER_EXPRESSION
%token REG_EXPER
%token VARIABLE
%token NUMBER
%token STRING_LITERAL
%token FUNCTION_NAME
%token ARROW_RIGHT
%token TYPE_NAME
%token BUILTIN_TYPE
%token CONST
%token CONST_SYMBOL
%token DOT
%token KEYWORD
%token COMPILED_SIGN
%token BUILT_IN_FUNCTION_TYPE
%token TYPE_SYN_CONTEXT
%token FIELD_TYPE
%token DIMENSION
%token REF_SYMBOL
%token ORDER_SYMBOL



%token UNKNOWN
%token <i_type> NUMBER


%type <i_type> number


%start number


/*
  The first part of processing will be to to eliminate comments and normalize spacing.
	So, comments will not be part of the grammar.

	Assume that all special symbols are known from the lexer.
	
*/


%%



module : ( definitive_elements )+
;





definitive_elements : common_key_word_expression |  type_definitions | function_mapping_forms | specialized_form_function_definitions | variable_definitions | constant_definitions
;


/*
	COMMON KEYWORD EXPRESSION .. most things look like this.

At the top level, these can be expected.
imports
exports
data source
data sink

*/
common_key_word_expression :
		keyword_sequence '(' keyword_dependent_parameters ')' ( '{' evaluation_list '}' )?
;


/*
	TYPE DEFINITIONS

	synonymic_type_definition - Name one type in terms of the other.
	abstract_type_schema - very much like a template definition.  Followed by any program part, but wrapped in context syntactic sugar.
					The plan is that it all acts like a type schema. It may be in some sense a class definition.
	partial_abstract_type_instantiation - take one of those abstract_type_schema and put some types into it, but not all
	classic_type_definition - use the class keywod (as a special case of keywords)

*/


type_definitions :
		  synonymic_type_definition
		| abstract_type_schema  "{!" definitive_elements "!}"
		| partial_abstract_type_instantiation
		| classic_type_definition
;


/*

	FUNCTION MAPPING FORM
	state the type signature of a function.

*/

function_mapping_forms :
		FUNCTION_NAME "::" function_mapping_forms_signature
;



function_mapping_forms_signature :
		  cartesian_domain ARROW_RIGHT return_type
		| cartesian_domain ARROW_RIGHT curried_return_type ARROW_RIGHT return_type
;



specialized_form_function_definitions :
		  static_curried_function_definition
		| static_functional_composition
;



/*

	VARIABLE DEFINITION - associate a type with a symbol, and make the symbol a point of operation in the scope.
	Optionally evaluate something to make an initial value for the variable.

*/

variable_definitions :
	  abstract_type_identifier variable_def_list
	| VARIABLE "="  well_known_type_constructor
;


/*

	CONSTANT DEFINITION - associate a type with a symbol, and make the symbol a point of operation in the scope.
	state the type signature of a function.

*/

constant_definitions :
		  one_const_definition
		| one_const_definition "," constant_definitions
;




/*

	ATOMICS
	ABSTRACT TYPE IDENTIFIER - identify an existing type for use in variable and expression classification.
	
	ONE VARIABLE DEFINITION - follows an abstract type identifier
	ONE CONST DEFINITION - similar to one variable, but must be a capitalized constant, and the initialization expression is required.
*/


abstract_type_identifier :
		TYPE_NAME
	|	type_form_identifer "<" type_name_list ">"
	|	BUILTIN_TYPE
;



one_variable_definition :
	    (ref_syntax)? VARIABLE ( initialization_expression )?
;



one_const_definition :
	CONST  CONST_SYMBOL  initialization_expression
;


/*
	KEYWORD DEPENDENT PARAMETERS - the contents of the parenthesis after a keyword.

*/

keyword_dependent_parameters :
		  parameter_list
		| generator_expression
		| CONST_SYMBOL
;




/*

	LISTS


*/

type_name_list :
	abstract_type_identifier "," type_name_list
;




parameter_list :
		expression ',' parameter_list
		expression
;




variable_def_list :
		  one_variable_definition
		| one_variable_definition "," variable_def_list
;





keyword_sequence :
		  DOT KEYWORD
		| DOT KEYWORD keyword_sequence
;



evaluation_list :
		  evaluation_sequence
		| evaluative_competition
;


evaluation_sequence :
		  evaluation
		| evaluation ';' evaluation_sequence
;



match_expression_list :
		  match_expession
		| match_expession match_expression_list
;




dimension_list :
		  dimension
		| dimension ',' dimension_list
;


var_type_bind_and_filter_list :
		    var_type_bind_and_filter
		  | var_type_bind_and_filter var_type_bind_and_filter_list
;

/*

	OTHER TERMINALS


*/



initialization_expression :
		  "=" common_key_word_expression
		| "=" evaluation
;


cartesian_domain :
		"<" type_name_list ">"
;

return_type :
	abstract_type_identifier
;


curried_return_type :
		"C" "<" mixed_types_and_values ">"
;


mixed_types_and_values :
		abstract_type_identifier "," mixed_types_and_values
	|	expression "," mixed_types_and_values
	|	abstract_type_identifier
	|	expression
;



type_name_variable_list :
		abstract_type_identifier "," type_name_variable_list
	|	type_replacement_variable "," type_name_variable_list
	|	abstract_type_identifier
	|	type_replacement_variable
;



type_variable_list :
		type_replacement_variable "," type_name_variable_list
	|	type_replacement_variable
;




map_list :
		  map_element
		| map_element ',' map_list
;





evaluative_competition :
		COMPETITION_SPEC match_expression_list
;








/*
	common_key_word_expression restricted to .*
*/

static_functional_composition :
		COMPILED_SIGN BUILT_IN_FUNCTION_TYPE FUNCTION_NAME "=" FUNCTION_NAME common_key_word_expression
;


/*
	unbound parameters only
*/

static_curried_function_definition :
		COMPILED_SIGN BUILT_IN_FUNCTION_TYPE  FUNCTION_NAME "=" FUNCTION_NAME "("  parameter_list  ")"
;



synonymic_type_definition :
		TYPE_SYN_CONTEXT TYPE_NAME "=" abstract_type_identifier
;


/*
	A resulting static context will be assumed.
*/

well_known_type_constructor :
		  vector_constructor
		| matrix_constructor
		| tensor_constructor
		| string_literal
		| float_literal
		| int_literal
;




/*

	TYPE_OBJECT_CONTEXT == Type_Object

*/

classic_type_definition :
	TYPE_OBJECT_CONTEXT TYPE_NAME "=" DOT DERIVATION_KEY_WORD ('(' ( type_name_list )? ')' ) '{' definitive_elements '}'
;



/*

	TYPE_PARTIAL_CONTEXT == Type_Specializer

*/

partial_abstract_type_instantiation :
	TYPE_PARTIAL_CONTEXT TYPE_NAME "=" type_form_identifer "<" type_name_variable_list ">"
;


/*

	TYPE_ABSTRACTION_CONTEXT == Type_Schema

*/


abstract_type_schema :
	TYPE_ABSTRACTION_CONTEXT type_form_identifer "<" type_variable_list ">"  "="
;


type_form_identifer :
	TYPE_NAME
	| FIELD_TYPE '{' DIMENSION '}'
;




/*

	expressions

*/



match_expession :
	  type_match_pattern "->" repsonse_action
	| regular_expression "->" repsonse_action
	| working_memory_pattern "->" repsonse_action
	| membership_test "->" repsonse_action
;


repsonse_action : "{"  evaluation_list    "}"
;


/*
	allows some rnge of expression... consider flow graph spec.....
*/


generator_expression :
		  generator_shortcuts
		| '[' generation_specifier ']'
		| '{' generation_specifier '}'
		| '(' generation_specifier ')'
		|  range
;


/*
	allows some rnge of expression... consider flow graph spec.....
*/


generation_specifier :
  		  ( dimension_specifier )? '['  data_typification '|' generation_calculation   ']'
		| '{'  data_typification '|' generation_calculation   '}'
		| '('  data_typification '|' generation_calculation   ')'
		| "{#" ( hash_mapper_lambda )?  data_typification '|' generation_calculation "#}"
		| '{'  ( hash_mapper_lambda )?  map_list '}'
		| "{#" ( hash_mapper_lambda )?  map_list "#}"
		| restricted_set_selection
;



range :
	  '[' expression ".." expression ']' (stepper)?
	| '[' expression "," expression ']'(stepper)?
;



generator_shortcuts :
		list_match_expression
	|	value_container common_key_word_expression
	|	expression
;



list_match_expression :
		( VARIABLE )? ':' list_rest_pattern
;



list_rest_pattern :
		VARIABLE | REF_SYMBOL VARIABLE
;



hash_mapper_lambda :
		common_key_word_expression '#'
;



data_typification :
		  '(' var_type_bind_and_filter_list ')'
		| mapper_element
;


var_type_bind_and_filter :
		  VARIABLE ( ':' type_form_identifer )?  ( ':' ordering_predicate )?
		| '*'
		| type_form_identifer
;


ordering_predicate :
	"%-" ORDER_SYMBOL "-%"
;




/*
	special list
*/

generation_calculation :
		  generation_part "|>" generation_calculation
		| generation_part
;



generation_part :
		  VARIABLE (common_key_word_expression)+
		| one_variable_definition (one_variable_definition)*
		| set_producer_expression
;



stepper :
		"^!" numerical_expression
;



numerical_expression :
		expression
;



restricted_set_selection :
	set_producer_expression "|\\" cardinality_map
;



set_producer_expression :
		surface_copy
		| deep_copy
;



deep_copy :
		'`' surface_copy
;


surface_copy :
		'{' TYPE_NAME '}'
;



cardinality_map :
		FUNCTION_NAME '(' cardinality_specifier ')'
;




cardinality_specifier :
		'#' surface_copy
;



free_form_evaluation_list :
		  free_form_evaluation
		| free_form_evaluation ',' free_form_evaluation_list
;


free_form_evaluation :
		   '*'
		|  evaluation
;


dimension_specifier :
	'<' dimension_list '>'
;



map_element :
		key_expression "=>" evaluation
;



key_expression :
		  VARIABLE
		| evaluation
;



mapper_element :
	key_source_variables "=>" VARIABLE
;


key_source_variables:
		  VARIABLE
		| VARIABLE ',' key_source_variables
;




value_container :
	VARIABLE '='
	| '@' '='
	| '='
;



dimension :
	NUMBER | evaluation
;



evaluation :
		  NUMBER
		| STRING_LITERAL
		| functional_evaluation
		| common_key_word_expression
;



functional_evaluation :
		FUNCTION_NAME '(' free_form_evaluation_list ')'
;



expression :
		  evaluation ARITHMETIC_OP evaluation
		| '(' evaluation ')'
		| UNARY_OP '(' evaluation ')'
;



type_match_pattern :
		"</" type_name_list  "/>"
;

regular_expression :
		"//" REG_EXPER  "//"
;

working_memory_pattern :
		"(/" VAR_BINDER_EXPRESSION "/)"
;

membership_test :
		"?/" common_key_word_expression "/?"
;





%%


