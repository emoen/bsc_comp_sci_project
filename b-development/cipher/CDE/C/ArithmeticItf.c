#include "ArithmeticItf.h"

#define string1 " Input (NAT) Value for aa: "
#define string2 " Input (NAT) Value for bb: "
#define string3 " Value (NAT) returned in rr: "

#include "Arithmetic.h"
#include "ArithmeticIo.h"
#include "Itf_token_io.h"
#include "basic_io.h"
#include "file_dump.h"
#include "Scalar_TYPE.h"
#include "Bool_TYPE.h"
#include "String_TYPE.h"

void
INI_ArithmeticItf()
{
  INI_Arithmetic();
  INI_ArithmeticIo();
  INI_Itf_token_io();
  INI_basic_io();
  INI_file_dump();
  INI_Scalar_TYPE();
  INI_Bool_TYPE();
  INI_String_TYPE();

}

int
main(argc,argv)
int argc;
char **argv;
{
  INI_ArithmeticItf();
  {
    int count,op;
    count = 2147483646;
    op = Arithmetic_Menu_OP;
    while ( count != 0 && op != Quit_OP ) {
      switch ( op ) {
        case Arithmetic_Menu_OP :
          NWL(1);
          Arithmetic_Menu();
          NWL(1);
          break;
        case exp_op_OP :
          NWL(1);
          {
            int aaX,bbX,rrX;
            GET_PROMPT_NAT(&aaX,string1);
            GET_PROMPT_NAT(&bbX,string2);
            NWL(1);
            exp_op(&rrX,aaX,bbX);
            PUT_STR(string3);
            PUT_NBR(rrX);
            NWL(1);
          };
          NWL(1);
          break;
      };
      Get_Arithmetic_Op(&op);
      count = count-1;
    }
  }
  return 0;
}
