%{
#include <stdio.h>
/* definiciones */
int count_PC = 0;
int count_nom = 0;
int count_dir = 0;
int count_sim = 0;
%}
/* reglas */
%%
"inicia"|"crea"|"abre"|"ingresa"|"lista"    {printf("%s: PALABRA CLAVE\n" ,yytext); count_PC++;}
[A-Z][a-zA-Z]+(" ")[A-Z][a-zA-Z]+           {printf("%s: NOMBRE\n", yytext); count_nom++;}
[A-Z][a-zA-Z]+(" ")[0-9]+                   {printf("%s: DIRECCION\n", yytext); count_dir++;}
"("|")"|","                                 {printf("%s: SIMBOLO\n", yytext); count_sim++;}
[ \t\n]+                                    /*Salta los espacios y saltos de linea entre los tokens*/
.                                           {printf("%s: CARACTER NO RECONOCIDO\n", yytext);}
%%

int yywrap(){}

int main(){
    printf("Ingrese: ");
    // Llama al analisador lexico
    yylex();
    printf("N° PALABRAS RESERVADAS: %i\nN° NOMBRES: %i\nN° DIRECCIONES: %i\n N° SIMBOLOS: %i", count_PC, count_nom, count_dir, count_sim);
    return 0;
}