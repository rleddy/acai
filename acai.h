#ifndef YY_Parser_h_included
#define YY_Parser_h_included
#define YY_USE_CLASS

#line 1 "/usr/share/bison++/bison.h"
/* before anything */
#ifdef c_plusplus
 #ifndef __cplusplus
  #define __cplusplus
 #endif
#endif


 #line 8 "/usr/share/bison++/bison.h"
#define YY_Parser_LSP_NEEDED 
#define YY_Parser_MEMBERS  \
          virtual ~Parser() {} \
          private: \
                yyFlexLexer lexer;
#define YY_Parser_LEX_BODY  {return lexer.yylex();}
#define YY_Parser_ERROR_BODY  {cerr << "error encountered at line: "<<lexer.lineno()<<"last word parsed:"<<lexer.YYText()<<"\n";}
#line 12 "acai.y"

#include <iostream>
#include <fstream>
#include <FlexLexer.h>
#include <stdlib.h>
using namespace std;

#line 21 "acai.y"
typedef union {
                int i_type;
} yy_Parser_stype;
#define YY_Parser_STYPE yy_Parser_stype

#line 21 "/usr/share/bison++/bison.h"
 /* %{ and %header{ and %union, during decl */
#ifndef YY_Parser_COMPATIBILITY
 #ifndef YY_USE_CLASS
  #define  YY_Parser_COMPATIBILITY 1
 #else
  #define  YY_Parser_COMPATIBILITY 0
 #endif
#endif

#if YY_Parser_COMPATIBILITY != 0
/* backward compatibility */
 #ifdef YYLTYPE
  #ifndef YY_Parser_LTYPE
   #define YY_Parser_LTYPE YYLTYPE
/* WARNING obsolete !!! user defined YYLTYPE not reported into generated header */
/* use %define LTYPE */
  #endif
 #endif
/*#ifdef YYSTYPE*/
  #ifndef YY_Parser_STYPE
   #define YY_Parser_STYPE YYSTYPE
  /* WARNING obsolete !!! user defined YYSTYPE not reported into generated header */
   /* use %define STYPE */
  #endif
/*#endif*/
 #ifdef YYDEBUG
  #ifndef YY_Parser_DEBUG
   #define  YY_Parser_DEBUG YYDEBUG
   /* WARNING obsolete !!! user defined YYDEBUG not reported into generated header */
   /* use %define DEBUG */
  #endif
 #endif 
 /* use goto to be compatible */
 #ifndef YY_Parser_USE_GOTO
  #define YY_Parser_USE_GOTO 1
 #endif
#endif

/* use no goto to be clean in C++ */
#ifndef YY_Parser_USE_GOTO
 #define YY_Parser_USE_GOTO 0
#endif

#ifndef YY_Parser_PURE

 #line 65 "/usr/share/bison++/bison.h"

#line 65 "/usr/share/bison++/bison.h"
/* YY_Parser_PURE */
#endif


 #line 68 "/usr/share/bison++/bison.h"

#line 68 "/usr/share/bison++/bison.h"
/* prefix */

#ifndef YY_Parser_DEBUG

 #line 71 "/usr/share/bison++/bison.h"

#line 71 "/usr/share/bison++/bison.h"
/* YY_Parser_DEBUG */
#endif

#ifndef YY_Parser_LSP_NEEDED

 #line 75 "/usr/share/bison++/bison.h"

#line 75 "/usr/share/bison++/bison.h"
 /* YY_Parser_LSP_NEEDED*/
#endif

/* DEFAULT LTYPE*/
#ifdef YY_Parser_LSP_NEEDED
 #ifndef YY_Parser_LTYPE
  #ifndef BISON_YYLTYPE_ISDECLARED
   #define BISON_YYLTYPE_ISDECLARED
typedef
  struct yyltype
    {
      int timestamp;
      int first_line;
      int first_column;
      int last_line;
      int last_column;
      char *text;
   }
  yyltype;
  #endif

  #define YY_Parser_LTYPE yyltype
 #endif
#endif

/* DEFAULT STYPE*/
#ifndef YY_Parser_STYPE
 #define YY_Parser_STYPE int
#endif

/* DEFAULT MISCELANEOUS */
#ifndef YY_Parser_PARSE
 #define YY_Parser_PARSE yyparse
#endif

#ifndef YY_Parser_LEX
 #define YY_Parser_LEX yylex
#endif

#ifndef YY_Parser_LVAL
 #define YY_Parser_LVAL yylval
#endif

#ifndef YY_Parser_LLOC
 #define YY_Parser_LLOC yylloc
#endif

#ifndef YY_Parser_CHAR
 #define YY_Parser_CHAR yychar
#endif

#ifndef YY_Parser_NERRS
 #define YY_Parser_NERRS yynerrs
#endif

#ifndef YY_Parser_DEBUG_FLAG
 #define YY_Parser_DEBUG_FLAG yydebug
#endif

#ifndef YY_Parser_ERROR
 #define YY_Parser_ERROR yyerror
#endif

#ifndef YY_Parser_PARSE_PARAM
 #ifndef __STDC__
  #ifndef __cplusplus
   #ifndef YY_USE_CLASS
    #define YY_Parser_PARSE_PARAM
    #ifndef YY_Parser_PARSE_PARAM_DEF
     #define YY_Parser_PARSE_PARAM_DEF
    #endif
   #endif
  #endif
 #endif
 #ifndef YY_Parser_PARSE_PARAM
  #define YY_Parser_PARSE_PARAM void
 #endif
#endif

/* TOKEN C */
#ifndef YY_USE_CLASS

 #ifndef YY_Parser_PURE
  #ifndef yylval
   extern YY_Parser_STYPE YY_Parser_LVAL;
  #else
   #if yylval != YY_Parser_LVAL
    extern YY_Parser_STYPE YY_Parser_LVAL;
   #else
    #warning "Namespace conflict, disabling some functionality (bison++ only)"
   #endif
  #endif
 #endif


 #line 169 "/usr/share/bison++/bison.h"
#define	VAR_BINDER_EXPRESSION	258
#define	REG_EXPER	259
#define	VARIABLE	260
#define	ATOMIC_VARIABLE	261
#define	NUMBER	262
#define	STRING_LITERAL	263
#define	FLOAT_LITERAL	264
#define	INT_LITERAL	265
#define	FUNCTION_NAME	266
#define	ARROW_RIGHT	267
#define	TYPE_NAME	268
#define	BUILTIN_TYPE	269
#define	CONST	270
#define	CONST_SYMBOL	271
#define	DOT	272
#define	KEYWORD	273
#define	COMPILED_SIGN	274
#define	BUILT_IN_FUNCTION_TYPE	275
#define	TYPE_SYN_CONTEXT	276
#define	FIELD_TYPE	277
#define	DIMENSION	278
#define	REF_SYMBOL	279
#define	ORDER_SYMBOL	280
#define	COMPETITION_SPEC	281
#define	OPEN_ABSRTRACT_TYPE_SCHEMA	282
#define	CLOSE_ABSRTRACT_TYPE_SCHEMA	283
#define	FUNCTION_MAP_INTRODUCER	284
#define	EQUALS	285
#define	RIGHT_ARROW	286
#define	HASH_OPEN	287
#define	HASH_CLOSE	288
#define	ODERING_PREDICATE_OPEN	289
#define	ODERING_PREDICATE_CLOSE	290
#define	GENERATION_SEPERATOR	291
#define	CARDINALITY_RESTRICTION_SYMBOL	292
#define	MAP_MEMBER_INTRODUCER	293
#define	DEREF_CONTAINER_SYMBOL	294
#define	OPEN_TYPE_MACHTER	295
#define	CLOSE_TYPE_MACHTER	296
#define	OPEN_REGEXP_MATCHER	297
#define	CLOSE_REGEXP_MATCHER	298
#define	OPEN_WORKING_MEMORY_MATCHER	299
#define	CLOSE_WORKING_MEMORY_MATCHER	300
#define	OPEN_MEMBERSHIP_TEST_MATCHER	301
#define	CLOSE_MEMBERSHIP_TEST_MATCHER	302
#define	RANGE_INDICATOR_SYMBOL	303
#define	STEPPER_INTRODUCER_SYMBOL	304
#define	TYPE_OBJECT_CONTEXT	305
#define	TYPE_PARTIAL_CONTEXT	306
#define	TYPE_ABSTRACTION_CONTEXT	307
#define	DERIVATION_KEY_WORD	308
#define	TYPE_REPLACEMENT_VARIABLE	309
#define	MEMBER_VARIABLE	310
#define	UNARY_OP	311
#define	DEREF	312
#define	ARITHMETIC_OP	313


#line 169 "/usr/share/bison++/bison.h"
 /* #defines token */
/* after #define tokens, before const tokens S5*/
#else
 #ifndef YY_Parser_CLASS
  #define YY_Parser_CLASS Parser
 #endif

 #ifndef YY_Parser_INHERIT
  #define YY_Parser_INHERIT
 #endif

 #ifndef YY_Parser_MEMBERS
  #define YY_Parser_MEMBERS 
 #endif

 #ifndef YY_Parser_LEX_BODY
  #define YY_Parser_LEX_BODY  
 #endif

 #ifndef YY_Parser_ERROR_BODY
  #define YY_Parser_ERROR_BODY  
 #endif

 #ifndef YY_Parser_CONSTRUCTOR_PARAM
  #define YY_Parser_CONSTRUCTOR_PARAM
 #endif
 /* choose between enum and const */
 #ifndef YY_Parser_USE_CONST_TOKEN
  #define YY_Parser_USE_CONST_TOKEN 0
  /* yes enum is more compatible with flex,  */
  /* so by default we use it */ 
 #endif
 #if YY_Parser_USE_CONST_TOKEN != 0
  #ifndef YY_Parser_ENUM_TOKEN
   #define YY_Parser_ENUM_TOKEN yy_Parser_enum_token
  #endif
 #endif

class YY_Parser_CLASS YY_Parser_INHERIT
{
public: 
 #if YY_Parser_USE_CONST_TOKEN != 0
  /* static const int token ... */
  
 #line 212 "/usr/share/bison++/bison.h"
static const int VAR_BINDER_EXPRESSION;
static const int REG_EXPER;
static const int VARIABLE;
static const int ATOMIC_VARIABLE;
static const int NUMBER;
static const int STRING_LITERAL;
static const int FLOAT_LITERAL;
static const int INT_LITERAL;
static const int FUNCTION_NAME;
static const int ARROW_RIGHT;
static const int TYPE_NAME;
static const int BUILTIN_TYPE;
static const int CONST;
static const int CONST_SYMBOL;
static const int DOT;
static const int KEYWORD;
static const int COMPILED_SIGN;
static const int BUILT_IN_FUNCTION_TYPE;
static const int TYPE_SYN_CONTEXT;
static const int FIELD_TYPE;
static const int DIMENSION;
static const int REF_SYMBOL;
static const int ORDER_SYMBOL;
static const int COMPETITION_SPEC;
static const int OPEN_ABSRTRACT_TYPE_SCHEMA;
static const int CLOSE_ABSRTRACT_TYPE_SCHEMA;
static const int FUNCTION_MAP_INTRODUCER;
static const int EQUALS;
static const int RIGHT_ARROW;
static const int HASH_OPEN;
static const int HASH_CLOSE;
static const int ODERING_PREDICATE_OPEN;
static const int ODERING_PREDICATE_CLOSE;
static const int GENERATION_SEPERATOR;
static const int CARDINALITY_RESTRICTION_SYMBOL;
static const int MAP_MEMBER_INTRODUCER;
static const int DEREF_CONTAINER_SYMBOL;
static const int OPEN_TYPE_MACHTER;
static const int CLOSE_TYPE_MACHTER;
static const int OPEN_REGEXP_MATCHER;
static const int CLOSE_REGEXP_MATCHER;
static const int OPEN_WORKING_MEMORY_MATCHER;
static const int CLOSE_WORKING_MEMORY_MATCHER;
static const int OPEN_MEMBERSHIP_TEST_MATCHER;
static const int CLOSE_MEMBERSHIP_TEST_MATCHER;
static const int RANGE_INDICATOR_SYMBOL;
static const int STEPPER_INTRODUCER_SYMBOL;
static const int TYPE_OBJECT_CONTEXT;
static const int TYPE_PARTIAL_CONTEXT;
static const int TYPE_ABSTRACTION_CONTEXT;
static const int DERIVATION_KEY_WORD;
static const int TYPE_REPLACEMENT_VARIABLE;
static const int MEMBER_VARIABLE;
static const int UNARY_OP;
static const int DEREF;
static const int ARITHMETIC_OP;


#line 212 "/usr/share/bison++/bison.h"
 /* decl const */
 #else
  enum YY_Parser_ENUM_TOKEN { YY_Parser_NULL_TOKEN=0
  
 #line 215 "/usr/share/bison++/bison.h"
	,VAR_BINDER_EXPRESSION=258
	,REG_EXPER=259
	,VARIABLE=260
	,ATOMIC_VARIABLE=261
	,NUMBER=262
	,STRING_LITERAL=263
	,FLOAT_LITERAL=264
	,INT_LITERAL=265
	,FUNCTION_NAME=266
	,ARROW_RIGHT=267
	,TYPE_NAME=268
	,BUILTIN_TYPE=269
	,CONST=270
	,CONST_SYMBOL=271
	,DOT=272
	,KEYWORD=273
	,COMPILED_SIGN=274
	,BUILT_IN_FUNCTION_TYPE=275
	,TYPE_SYN_CONTEXT=276
	,FIELD_TYPE=277
	,DIMENSION=278
	,REF_SYMBOL=279
	,ORDER_SYMBOL=280
	,COMPETITION_SPEC=281
	,OPEN_ABSRTRACT_TYPE_SCHEMA=282
	,CLOSE_ABSRTRACT_TYPE_SCHEMA=283
	,FUNCTION_MAP_INTRODUCER=284
	,EQUALS=285
	,RIGHT_ARROW=286
	,HASH_OPEN=287
	,HASH_CLOSE=288
	,ODERING_PREDICATE_OPEN=289
	,ODERING_PREDICATE_CLOSE=290
	,GENERATION_SEPERATOR=291
	,CARDINALITY_RESTRICTION_SYMBOL=292
	,MAP_MEMBER_INTRODUCER=293
	,DEREF_CONTAINER_SYMBOL=294
	,OPEN_TYPE_MACHTER=295
	,CLOSE_TYPE_MACHTER=296
	,OPEN_REGEXP_MATCHER=297
	,CLOSE_REGEXP_MATCHER=298
	,OPEN_WORKING_MEMORY_MATCHER=299
	,CLOSE_WORKING_MEMORY_MATCHER=300
	,OPEN_MEMBERSHIP_TEST_MATCHER=301
	,CLOSE_MEMBERSHIP_TEST_MATCHER=302
	,RANGE_INDICATOR_SYMBOL=303
	,STEPPER_INTRODUCER_SYMBOL=304
	,TYPE_OBJECT_CONTEXT=305
	,TYPE_PARTIAL_CONTEXT=306
	,TYPE_ABSTRACTION_CONTEXT=307
	,DERIVATION_KEY_WORD=308
	,TYPE_REPLACEMENT_VARIABLE=309
	,MEMBER_VARIABLE=310
	,UNARY_OP=311
	,DEREF=312
	,ARITHMETIC_OP=313


#line 215 "/usr/share/bison++/bison.h"
 /* enum token */
     }; /* end of enum declaration */
 #endif
public:
 int YY_Parser_PARSE(YY_Parser_PARSE_PARAM);
 virtual void YY_Parser_ERROR(char *msg) YY_Parser_ERROR_BODY;
 #ifdef YY_Parser_PURE
  #ifdef YY_Parser_LSP_NEEDED
   virtual int  YY_Parser_LEX(YY_Parser_STYPE *YY_Parser_LVAL,YY_Parser_LTYPE *YY_Parser_LLOC) YY_Parser_LEX_BODY;
  #else
   virtual int  YY_Parser_LEX(YY_Parser_STYPE *YY_Parser_LVAL) YY_Parser_LEX_BODY;
  #endif
 #else
  virtual int YY_Parser_LEX() YY_Parser_LEX_BODY;
  YY_Parser_STYPE YY_Parser_LVAL;
  #ifdef YY_Parser_LSP_NEEDED
   YY_Parser_LTYPE YY_Parser_LLOC;
  #endif
  int YY_Parser_NERRS;
  int YY_Parser_CHAR;
 #endif
 #if YY_Parser_DEBUG != 0
  public:
   int YY_Parser_DEBUG_FLAG;	/*  nonzero means print parse trace	*/
 #endif
public:
 YY_Parser_CLASS(YY_Parser_CONSTRUCTOR_PARAM);
public:
 YY_Parser_MEMBERS 
};
/* other declare folow */
#endif


#if YY_Parser_COMPATIBILITY != 0
 /* backward compatibility */
 /* Removed due to bison problems
 /#ifndef YYSTYPE
 / #define YYSTYPE YY_Parser_STYPE
 /#endif*/

 #ifndef YYLTYPE
  #define YYLTYPE YY_Parser_LTYPE
 #endif
 #ifndef YYDEBUG
  #ifdef YY_Parser_DEBUG 
   #define YYDEBUG YY_Parser_DEBUG
  #endif
 #endif

#endif
/* END */

 #line 267 "/usr/share/bison++/bison.h"
#endif
