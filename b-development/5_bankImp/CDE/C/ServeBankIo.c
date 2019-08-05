#include "ServeBankIo.h"

#define string1 "ServeBank operation number? "

#include "basic_io.h"
#include "String_TYPE.h"

void
INI_ServeBankIo()
{
  ;
}

void
ServeBank_Menu()
{
  PUT_STR( (int *)" 0 ServeBank Menu ");
  NWL(2);
  PUT_STR( (int *)" 1 startServer");
  NWL(1);
  PUT_STR( (int *)" 2 listenForUser");
  NWL(2);
  PUT_STR( (int *)" 3 Quit");
  NWL(1);
}

void
Get_ServeBank_Op(_op)
int *_op;
{
  int opcode;
  GET_PROMPT_NBR(&opcode,string1,3);
  switch ( opcode ) {
    case 0 :
      *_op = ServeBank_Menu_OP;
      break;
    case 1 :
      *_op = startServer_OP;
      break;
    case 2 :
      *_op = listenForUser_OP;
      break;
    case 3 :
      *_op = Quit_OP;
      break;
  }
}

