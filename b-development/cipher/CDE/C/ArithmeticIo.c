#include "ArithmeticIo.h"

#define string1 "Arithmetic operation number? "

#include "basic_io.h"
#include "String_TYPE.h"

void
INI_ArithmeticIo()
{
  ;
}

void
Arithmetic_Menu()
{
  PUT_STR( (int *)" 0 Arithmetic Menu ");
  NWL(2);
  PUT_STR( (int *)" 1 exp_op");
  NWL(2);
  PUT_STR( (int *)" 2 Quit");
  NWL(1);
}

void
Get_Arithmetic_Op(_op)
int *_op;
{
  int opcode;
  GET_PROMPT_NBR(&opcode,string1,2);
  switch ( opcode ) {
    case 0 :
      *_op = Arithmetic_Menu_OP;
      break;
    case 1 :
      *_op = exp_op_OP;
      break;
    case 2 :
      *_op = Quit_OP;
      break;
  }
}

