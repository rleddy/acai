
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
%token ATOMIC_VARIABLE
%token NUMBER

%token STRING_LITERAL
%token FLOAT_LITERAL
%token INT_LITERAL

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
%token COMPETITION_SPEC


%token OPEN_ABSRTRACT_TYPE_SCHEMA    // "{!"
%token CLOSE_ABSRTRACT_TYPE_SCHEMA   // "!}"

%token FUNCTION_MAP_INTRODUCER  // "::"

%token EQUALS   // '='

%token RIGHT_ARROW  // '->'

%token HASH_OPEN // '{#'

%token HASH_CLOSE // '#}'
%token ODERING_PREDICATE_OPEN    //'%-'
%token ODERING_PREDICATE_CLOSE   //'-%'
%token GENERATION_SEPERATOR  //'|>'
%token CARDINALITY_RESTRICTION_SYMBOL //"|\\"
%token MAP_MEMBER_INTRODUCER //'=>'



%token DEREF_CONTAINER_SYMBOL  // (>)
%token OPEN_TYPE_MACHTER       // </
%token CLOSE_TYPE_MACHTER      // />
%token OPEN_REGEXP_MATCHER     //  "//"
%token CLOSE_REGEXP_MATCHER     //  "//"

%token OPEN_WORKING_MEMORY_MATCHER		//  '(/'
%token CLOSE_WORKING_MEMORY_MATCHER		//  '/)'

%token OPEN_MEMBERSHIP_TEST_MATCHER		//  '?/'
%token CLOSE_MEMBERSHIP_TEST_MATCHER 	//  '/)'
%token RANGE_INDICATOR_SYMBOL			//  '..'
%token STEPPER_INTRODUCER_SYMBOL		// '^!'

%token TYPE_OBJECT_CONTEXT  // == Type_Object
%token TYPE_PARTIAL_CONTEXT // == Type_Specializer
%token TYPE_ABSTRACTION_CONTEXT // == Type_Schema
%token DERIVATION_KEY_WORD // == from

%token TYPE_REPLACEMENT_VARIABLE
%token MEMBER_VARIABLE
%token UNARY_OP

%token DEREF

%token ARITHMETIC_OP

%token NUMBER



/*
	The first part of processing will be to to eliminate comments and normalize spacing.
	So, comments will not be part of the grammar.

	Assume that all special symbols are known from the lexer.

*/


%%



module : definitive_elements_list
;


definitive_elements_list :
	  definitive_elements
	| definitive_elements definitive_elements_list
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
		  keyword_sequence '(' keyword_dependent_parameters ')' '{' evaluation_list '}'
		| keyword_sequence '(' keyword_dependent_parameters ')'
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
		| abstract_type_schema  OPEN_ABSRTRACT_TYPE_SCHEMA definitive_elements CLOSE_ABSRTRACT_TYPE_SCHEMA
		| partial_abstract_type_instantiation
		| classic_type_definition
;


/*

	FUNCTION MAPPING FORM
	state the type signature of a function.

*/

function_mapping_forms :
		FUNCTION_NAME FUNCTION_MAP_INTRODUCER cartesian_domain ARROW_RIGHT function_mapping_forms_signature
;



function_mapping_forms_signature :
		   curried_return_type ARROW_RIGHT abstract_type_identifier
		|  abstract_type_identifier
;



specialized_form_function_definitions : COMPILED_SIGN BUILT_IN_FUNCTION_TYPE FUNCTION_NAME EQUALS FUNCTION_NAME specialized_form_function_def_split
;

/*
    second part is curried function definition
*/
specialized_form_function_def_split :
		  common_key_word_expression
		| '('  parameter_list  ')'
;




/*

	VARIABLE DEFINITION - associate a type with a symbol, and make the symbol a point of operation in the scope.
	Optionally evaluate something to make an initial value for the variable.

*/

variable_definitions :
	  abstract_type_identifier variable_def_list
	| VARIABLE EQUALS  well_known_type_constructor
;


/*

	CONSTANT DEFINITION - associate a type with a symbol, and make the symbol a point of operation in the scope.
	state the type signature of a function.

*/

constant_definitions :
		  one_const_definition
		| one_const_definition ',' constant_definitions
;




/*

	ATOMICS
	ABSTRACT TYPE IDENTIFIER - identify an existing type for use in variable and expression classification.

	ONE VARIABLE DEFINITION - follows an abstract type identifier
	ONE CONST DEFINITION - similar to one variable, but must be a capitalized constant, and the initialization expression is required.
*/


abstract_type_identifier :
		TYPE_NAME
	|	type_form_identifer '<' type_name_list '>'
	|	BUILTIN_TYPE
;



one_variable_definition :
		  VARIABLE
		| VARIABLE initialization_expression
		| ref_syntax VARIABLE initialization_expression
		| ref_syntax VARIABLE
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
	  abstract_type_identifier
	| abstract_type_identifier ',' type_name_list
;



parameter_list :
		  expression
		| parameter_list ',' expression
;




variable_def_list :
		  one_variable_definition
		| one_variable_definition ',' variable_def_list
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
		  DIMENSION
		| DIMENSION ',' dimension_list
;


var_type_bind_and_filter_list :
		    var_type_bind_and_filter
		  | var_type_bind_and_filter var_type_bind_and_filter_list
;



/*

	OTHER TERMINALS


*/



initialization_expression :
		EQUALS evaluation
;



cartesian_domain :
		'<' type_name_list '>'
;




curried_return_type :
		'C' '<' mixed_types_and_values '>'
;



mixed_types_and_values :
		abstract_type_identifier ',' mixed_types_and_values
	|	expression ',' mixed_types_and_values
	|	abstract_type_identifier
	|	expression
;



type_name_variable_list :
		abstract_type_identifier ',' type_name_variable_list
	|	TYPE_REPLACEMENT_VARIABLE ',' type_name_variable_list
	|	abstract_type_identifier
	|	TYPE_REPLACEMENT_VARIABLE
;



type_variable_list :
		TYPE_REPLACEMENT_VARIABLE ',' type_name_variable_list
	|	TYPE_REPLACEMENT_VARIABLE
;




map_list :
		  map_element
		| map_element ',' map_list
;





evaluative_competition :
		COMPETITION_SPEC match_expression_list
;









synonymic_type_definition :
		TYPE_SYN_CONTEXT TYPE_NAME EQUALS abstract_type_identifier
;


/*
	A resulting static context will be assumed.
*/

well_known_type_constructor :
		  vector_constructor
		| matrix_constructor
		| STRING_LITERAL
		| FLOAT_LITERAL
		| INT_LITERAL
;




/*

	TYPE_OBJECT_CONTEXT == Type_Object

*/

classic_type_definition :
	TYPE_OBJECT_CONTEXT TYPE_NAME EQUALS DOT DERIVATION_KEY_WORD '(' option_type_name_list ')'  '{' definitive_elements '}'
;



option_type_name_list :
		type_name_list
		|   /* empty */
;

/*

	TYPE_PARTIAL_CONTEXT == Type_Specializer

*/

partial_abstract_type_instantiation :
	TYPE_PARTIAL_CONTEXT TYPE_NAME EQUALS type_form_identifer '<' type_name_variable_list '>'
;


/*

	TYPE_ABSTRACTION_CONTEXT == Type_Schema

*/



abstract_type_schema :
	TYPE_ABSTRACTION_CONTEXT type_form_identifer '<' type_variable_list '>'  EQUALS
;


type_form_identifer :
	TYPE_NAME
	| FIELD_TYPE '{' evaluation '}'
;




/*

	expressions

*/

match_expession :
	  type_match_pattern RIGHT_ARROW repsonse_action
	| regular_expression RIGHT_ARROW repsonse_action
	| working_memory_pattern RIGHT_ARROW repsonse_action
	| membership_test RIGHT_ARROW repsonse_action
;


repsonse_action : '{'  evaluation_list    '}'
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
			dimension_specifier '['  data_typification '|' generation_calculation   ']'
 		  '['  data_typification '|' generation_calculation   ']'
		| '{'  data_typification '|' generation_calculation   '}'
		| '('  data_typification '|' generation_calculation   ')'
		|  HASH_OPEN hash_mapper_lambda data_typification '|' generation_calculation HASH_CLOSE
		|  HASH_OPEN data_typification '|' generation_calculation HASH_CLOSE
		|  HASH_OPEN map_list HASH_CLOSE
		| '{'  hash_mapper_lambda  map_list '}'
		| '{'  map_list '}'
		| restricted_set_selection
;




range :
	   '[' expression RANGE_INDICATOR_SYMBOL expression ']'
	|  '[' expression RANGE_INDICATOR_SYMBOL expression ']' stepper
	|  '[' expression ',' expression ']'
	|  '[' expression ',' expression ']'stepper
;



generator_shortcuts :
		list_match_expression
	|	value_container common_key_word_expression
;



list_match_expression :
		    VARIABLE ':' list_rest_pattern
		| ':' list_rest_pattern
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
		'*'
		|  VARIABLE ':' ordering_predicate
		|  VARIABLE ':' abstract_type_identifier  ':' ordering_predicate
		|  VARIABLE ':' abstract_type_identifier
		|  VARIABLE
		| abstract_type_identifier
;


ordering_predicate :
	ODERING_PREDICATE_OPEN ORDER_SYMBOL ODERING_PREDICATE_CLOSE
;




/*
	special list
*/



generation_calculation :
		  generation_part GENERATION_SEPERATOR generation_calculation
		| generation_part
;



generation_part :
		  VARIABLE  key_word_generation_def_list
		| one_variable_definition
		| one_variable_definition one_var_generation_def_list
		| set_producer_expression
;


key_word_generation_def_list :
			common_key_word_expression
		| common_key_word_expression key_word_generation_def_list
;


one_var_generation_def_list :
		  one_variable_definition
		| one_variable_definition one_var_generation_def_list
;

/* numerical expression */

stepper :
		STEPPER_INTRODUCER_SYMBOL expression
;



restricted_set_selection :
	set_producer_expression CARDINALITY_RESTRICTION_SYMBOL cardinality_map
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
		| '{' VARIABLE '}'
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
		evaluation MAP_MEMBER_INTRODUCER evaluation
;


/*
	says that the parts of the key are enumerated by the left of  "=>"
	And, the remaining variable is to the right, as the value identified with the key.
*/


mapper_element :
	key_source_variables MAP_MEMBER_INTRODUCER VARIABLE
;


key_source_variables:
		  ATOMIC_VARIABLE
		| ATOMIC_VARIABLE ',' key_source_variables
;




value_container :
	VARIABLE EQUALS
	| '@' EQUALS
	| EQUALS
;





evaluation :
		  NUMBER
		| STRING_LITERAL
		| VARIABLE
		| member_with_accessor
		| set_producer_expression
		| functional_evaluation
		| common_key_word_expression
;



member_with_accessor :
	VARIABLE member_accessor
;


member_accessor :
	DEREF MEMBER_VARIABLE
	| DEREF MEMBER_VARIABLE member_accessor
;


functional_evaluation :
		FUNCTION_NAME '(' free_form_evaluation_list ')'
;



expression :
		  evaluation ARITHMETIC_OP evaluation
		| '(' evaluation ')'
		| UNARY_OP '(' evaluation ')'
		| evaluation
;


type_match_pattern :
		OPEN_TYPE_MACHTER type_name_list  CLOSE_TYPE_MACHTER
;


regular_expression :
		OPEN_REGEXP_MATCHER    REG_EXPER    CLOSE_REGEXP_MATCHER
;


working_memory_pattern :
		OPEN_WORKING_MEMORY_MATCHER  VAR_BINDER_EXPRESSION  CLOSE_WORKING_MEMORY_MATCHER
;


membership_test :
		OPEN_MEMBERSHIP_TEST_MATCHER common_key_word_expression CLOSE_MEMBERSHIP_TEST_MATCHER
;



vector_constructor :
		'[' vector_components ']'
;



matrix_constructor :
		dimension_specifier '[' matrix_components ']'
;



matrix_components :
		  vector_components
		| vector_components ';' matrix_components
;



vector_components :
		  expression
		| expression ',' expression
;



ref_syntax :
		  '&'
		| deref_list
;



deref_list :
		  DEREF_CONTAINER_SYMBOL
		| DEREF_CONTAINER_SYMBOL deref_list
;


%%


