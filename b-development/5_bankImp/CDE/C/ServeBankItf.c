#include "ServeBankItf.h"

#define string1 " Value (BOOL) returned in ok: "

#include "ServeBank.h"
#include "ServeBankIo.h"
#include "Itf_token_io.h"
#include "basic_io.h"
#include "file_dump.h"
#include "Scalar_TYPE.h"
#include "Bool_TYPE.h"
#include "String_TYPE.h"

void
INI_ServeBankItf()
{
  INI_ServeBank();
  INI_ServeBankIo();
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
  INI_ServeBankItf();
  {
    int count,op;
    count = 2147483646;
    op = ServeBank_Menu_OP;
    while ( count != 0 && op != Quit_OP ) {
      switch ( op ) {
        case ServeBank_Menu_OP :
          NWL(1);
          ServeBank_Menu();
          NWL(1);
          break;
        case startServer_OP :
          NWL(1);
          {
            int okX;
            startServer(&okX);
            PUT_STR(string1);
            PUT_BOOL(okX);
            NWL(1);
          };
          NWL(1);
          break;
        case listenForUser_OP :
          NWL(1);
          listenForUser();
          NWL(1);
          break;
      };
      Get_ServeBank_Op(&op);
      count = count-1;
    }
  }
  return 0;
}
