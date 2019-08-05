#include "ATMItf.h"

#define string1 " Value (BOOL) returned in ok: "
#define string2 " Value (NAT) returned in accNr: "
#define string3 " Value (BOOL) returned in rep: "
#define string4 " Input (NAT) Value for acc: "
#define string5 " Input (NAT) Value for amount: "
#define string6 " Value (NAT) returned in newBalance: "
#define string7 " Value (BOOL) returned in rr: "
#define string8 " Value (NAT) returned in bal: "

#include "ATM.h"
#include "ATMIo.h"
#include "Itf_token_io.h"
#include "basic_io.h"
#include "file_dump.h"
#include "Scalar_TYPE.h"
#include "Bool_TYPE.h"
#include "String_TYPE.h"

void
INI_ATMItf()
{
  INI_ATM();
  INI_ATMIo();
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
  INI_ATMItf();
  {
    int count,op;
    count = 2147483646;
    op = ATM_Menu_OP;
    while ( count != 0 && op != Quit_OP ) {
      switch ( op ) {
        case ATM_Menu_OP :
          NWL(1);
          ATM_Menu();
          NWL(1);
          break;
        case connecting_OP :
          NWL(1);
          connecting();
          NWL(1);
          break;
        case shut_down_OP :
          NWL(1);
          {
            int okX;
            shut_down(&okX);
            PUT_STR(string1);
            PUT_BOOL(okX);
            NWL(1);
          };
          NWL(1);
          break;
        case create_account_OP :
          NWL(1);
          {
            int accNrX,repX;
            create_account(&accNrX,&repX);
            PUT_STR(string2);
            PUT_NBR(accNrX);
            NWL(1);
            PUT_STR(string3);
            PUT_BOOL(repX);
            NWL(1);
          };
          NWL(1);
          break;
        case deposit_OP :
          NWL(1);
          {
            int accX,amountX,okX,newBalanceX;
            GET_PROMPT_NAT(&accX,string4);
            GET_PROMPT_NAT(&amountX,string5);
            NWL(1);
            deposit(&okX,&newBalanceX,accX,amountX);
            PUT_STR(string1);
            PUT_BOOL(okX);
            NWL(1);
            PUT_STR(string6);
            PUT_NBR(newBalanceX);
            NWL(1);
          };
          NWL(1);
          break;
        case withdraw_OP :
          NWL(1);
          {
            int accX,amountX,okX;
            GET_PROMPT_NAT(&accX,string4);
            GET_PROMPT_NAT(&amountX,string5);
            NWL(1);
            withdraw(&okX,accX,amountX);
            PUT_STR(string1);
            PUT_BOOL(okX);
            NWL(1);
          };
          NWL(1);
          break;
        case isaccount_OP :
          NWL(1);
          {
            int accX,rrX;
            GET_PROMPT_NAT(&accX,string4);
            NWL(1);
            isaccount(&rrX,accX);
            PUT_STR(string7);
            PUT_BOOL(rrX);
            NWL(1);
          };
          NWL(1);
          break;
        case getbalance_OP :
          NWL(1);
          {
            int accX,balX;
            GET_PROMPT_NAT(&accX,string4);
            NWL(1);
            getbalance(&balX,accX);
            PUT_STR(string8);
            PUT_NBR(balX);
            NWL(1);
          };
          NWL(1);
          break;
      };
      Get_ATM_Op(&op);
      count = count-1;
    }
  }
  return 0;
}
