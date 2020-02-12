import java_cup.runtime.*;
%%
//%debug
%cup

Int = 0|[1-9][0-9]*
Rexp = [eE][+-]?[0-9]+
Real = (0|[0-9])+\.[0-9]*{Rexp}?|[0-9]*\.(0|[0-9])+{Rexp}?|[0-9]+{Rexp}

LineTerminator = \r|\n|\r\n
InputCharacter = [^\r\n]

TraditionalComment   = "/*" [^*] ~"*/" | "/*" "*"+ "/"
EndOfLineComment     = "//" {InputCharacter}* {LineTerminator}?
DocumentationComment = "/**" {CommentContent} "*"+ "/"
CommentContent       = ( [^*] | \*+ [^/*] )*
Comment =  {TraditionalComment} | {EndOfLineComment} | {DocumentationComment}

%%

/* Reserved words */
"int"                   { return new Symbol(sym.VAR_INT); }
"if"                    { return new Symbol(sym.IF); }
"else"                  { return new Symbol(sym.ELSE); }
"while"                 { return new Symbol(sym.WHILE); }
"do"                    { return new Symbol(sym.DO); }
"for"                   { return new Symbol(sym.FOR); }
"print"                 { return new Symbol(sym.PRINT); }
"return"                { return new Symbol(sym.RETURN); }

/* Separators */
"("                     { return new Symbol(sym.OP); }
")"                     { return new Symbol(sym.CP); }
"{"                     { return new Symbol(sym.OB); }
"}"                     { return new Symbol(sym.CB); }
";"                     { return new Symbol(sym.SEMICOLON); }
","                     { return new Symbol(sym.COMMA); }

/* Operators */
"++"                    { return new Symbol(sym.INC); }
"--"                    { return new Symbol(sym.DEC); }
"%"                     { return new Symbol(sym.MOD); }
"="                     { return new Symbol(sym.ASIG); }
"+"                     { return new Symbol(sym.PLUS); }
"-"                     { return new Symbol(sym.MINUS); }
"*"                     { return new Symbol(sym.MUL); }
"/"                     { return new Symbol(sym.DIV); }
"<"                     { return new Symbol(sym.LT); }
">"                     { return new Symbol(sym.GT); }
"<="                    { return new Symbol(sym.LTOREQ); }
">="                    { return new Symbol(sym.GTOREQ); }
"=="                    { return new Symbol(sym.EQ); }
"!="                    { return new Symbol(sym.NOTEQ); }
"&&"                    { return new Symbol(sym.AND); }
"||"                    { return new Symbol(sym.OR); }
"!"                     { return new Symbol(sym.NOT); }

/* Numbers */
{Int}                   { return new Symbol(sym.INT, yytext()); }

/* Variables */
[a-zA-Z_][a-zA-Z0-9]*   { return new Symbol(sym.VAR, yytext()); }

/* Everything else */
{Comment}               {}
[^]                     {}