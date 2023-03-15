%{
#include<stdio.h>
#include "y.tab.h"
%}
Token           RE
subjecttypeone	"He"|"She"|"It"
subjecttypetwo	"I"
subjecttypethree	"We"|"They"|"You"
am			"am"
is			"is"
are			"are"
have			"have"
has			"has"
had			"had"
been			"been"
was			"was"
were			"were"
willshall		"will"|"shall"
be			"be"
verb			"play"|"smash"|"give"|"feel"|"write"|"watch"|"ask"|"learn"|"begin"|"choose"|"drive"
verbwiths		"plays"|"smashes"|"gives"|"feels"|"writes"|"watches"|"askes"|"learns"|"begins"|"chooses"|"drives"
verbwithing		"playing"|"smashing"|"giving"|"feeling"|"writing"|"watching"|"asking"|"learning"|"beginning"|"choosing"|"driving"
verbpastandparti	"played"|"smashed"|"felt"|"Watched"|"asked"|"learned"|"learnt"
verbpast		"gave"|"wrote"|"began"|"chose"|"drove"
verbpastparti	"given"|"written"|"begun"|"chosen"|"driven"
object		"cricket"|"car"|"football"|"teacher"|"anime"|"maths"|"violence"|"glass"|"letter"|"journal"|"dog"|"blessings"|"tension"|"Netflix"|"bike"
eos			"."
separator		","|"and"
ws			[ \t\n]
%%
{subjecttypeone}		{printf("subject = %s\n",yytext);return SUBJECTTYPEONE;}
{subjecttypetwo}		{printf("subject = %s\n",yytext);return SUBJECTTYPETWO;}
{subjecttypethree}	{printf("subject = %s\n",yytext);return SUBJECTTYPETHREE;}
{am}				{printf("am = %s\n",yytext);return AM;}
{is}				{printf("is = %s\n",yytext);return IS;}
{are}				{printf("are = %s\n",yytext);return ARE;}
{have}			{printf("have = %s\n",yytext);return HAVE;}
{has}				{printf("has = %s\n",yytext);return HAS;}
{had}				{printf("had = %s\n",yytext);return HAD;}
{been}			{printf("been = %s\n",yytext);return BEEN;}
{was}				{printf("was = %s\n",yytext);return WAS;}
{were}			{printf("were = %s\n",yytext);return WERE;}
{willshall}			{printf("will/shall = %s\n",yytext);return WILLSHALL;}
{be}				{printf("be = %s\n",yytext);return BE;}
{verbwiths}			{printf("verb-with-s = %s\n",yytext);return VERBWITHS;}
{verbwithing}		{printf("verb-with-ing = %s\n",yytext);return VERBWITHING;}
{verbpastparti}		{printf("verb-past-participle = %s\n",yytext);return VERBPASTPARTI;}
{verbpast}			{printf("verb-past = %s\n",yytext);return VERBPAST;}
{verbpastandparti}	{printf("verb-past-as-well-as-past-participle = %s\n",yytext);return VERBPASTANDPARTI;}
{verb}			{printf("verb = %s\n",yytext);return VERB;}
{object}			{printf("object = %s\n",yytext);return OBJECT;}
{eos}				{printf("eos = %s\n",yytext);return DOT;}
{separator}			{printf("separator = %s\n",yytext);return SEPERATOR;}
{ws}				{return WHITESPACE;}
.				{printf("Invalid Token : %s\n",yytext);return 0;return *yytext;}
%%
int yywrap()
{
return 1;
}