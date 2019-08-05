#include "ServeBank.h"

#include "Bank.h"
#include "Bank_SocketServer.h"
#include "Cipher.h"
#include "publicDecrypt_Nvar.h"

#include "basic_io.h"
#include "file_dump.h"
#include "String_TYPE.h"
#include "Scalar_TYPE.h"
#include "Bool_TYPE.h"

void
INI_ServeBank()
{
  INI_Bank();
  INI_Bank_SocketServer();
  INI_Cipher();
  INI_publicDecrypt_Nvar();
  publicDecrypt_STO_NVAR(0);
}

void
startServer(_ok)
int *_ok;
{
  int xx;
  PUT_STR( (int *)"Server running.\n");
  FLSH();
  Bank_INIT(&xx, (int *)"banklock",3200, (int *)"bankbuff");
  Bank_ACCEPT(_ok);
  PUT_STR( (int *)"connection Established.\n");
}

void
listenForUser()
{
  int rep,pp,op;
  while ( 1 == 1 ) {
    PUT_STR( (int *)"\nWAITING HERE...\n");
    Bank_READ(&rep,&pp);
    Bank_GET_TOK(&op,1);
    PUT_STR( (int *)"First tok is");
    PUT_NAT(op);
    PUT_STR( (int *)"\n");
    if ( op == 1 ) {
      PUT_STR( (int *)"\nINSIDE create_account\n");
      {
        int ret_a,ret_b,crypt_ret;
        create_account(&ret_a,&ret_b);
        PUT_STR( (int *)"calling create acc.\n");
        PUT_STR( (int *)"account number is:");
        PUT_NAT(ret_a);
        PUT_STR( (int *)"\n");
        encrypt_op(&crypt_ret,ret_a);
        Bank_PUT_TOK(crypt_ret,1);
        Bank_PUT_TOK(ret_b,1);
        PUT_STR( (int *)"Going to write tok\n");
        Bank_WRITE(&rep);
        PUT_STR( (int *)"have put str\n");
      }
    };
    if ( op == 2 ) {
      PUT_STR( (int *)"\nINSIDE deposit\n");
      {
        int in_a,in_b,ret_a,ret_b;
        Bank_GET_TOK(&in_a,1);
        Bank_GET_TOK(&in_b,1);
        deposit(&ret_a,&ret_b,in_a,in_b);
        PUT_STR( (int *)"deposit to accNr: ");
        PUT_NAT(in_a);
        PUT_STR( (int *)" amount:");
        PUT_NAT(in_b);
        PUT_STR( (int *)"\n");
        Bank_PUT_TOK(ret_a,1);
        Bank_PUT_TOK(ret_b,1);
        Bank_WRITE(&rep);
      }
    };
    if ( op == 3 ) {
      PUT_STR( (int *)"\nINSIDE withdraw\n");
      {
        int in_a,in_b,ret_a;
        Bank_GET_TOK(&in_a,1);
        Bank_GET_TOK(&in_b,1);
        withdraw(&ret_a,in_a,in_b);
        PUT_STR( (int *)"withdraw from accNr: ");
        PUT_NAT(in_a);
        PUT_STR( (int *)" amount: ");
        PUT_NAT(in_b);
        PUT_STR( (int *)"\n");
        Bank_PUT_TOK(ret_a,1);
        Bank_WRITE(&rep);
      }
    };
    if ( op == 4 ) {
      PUT_STR( (int *)"\nINSIDE isaccount\n");
      {
        int in_a,ret_a;
        Bank_GET_TOK(&in_a,1);
        isaccount(&ret_a,in_a);
        PUT_STR( (int *)"isaccount with accNr: ");
        PUT_NAT(in_a);
        PUT_STR( (int *)"\n");
        Bank_PUT_TOK(ret_a,1);
        Bank_WRITE(&rep);
      }
    };
    if ( op == 5 ) {
      PUT_STR( (int *)"\nINSIDE getbalance\n");
      {
        int in_a,ret_a;
        Bank_GET_TOK(&in_a,1);
        getbalance(&ret_a,in_a);
        PUT_STR( (int *)"balance for accNr: ");
        PUT_NAT(in_a);
        PUT_STR( (int *)"\n");
        Bank_PUT_TOK(ret_a,1);
        Bank_WRITE(&rep);
      }
    };
    if ( rep == FALSE ) {
      PUT_STR( (int *)"could not send value\n");
    }
    else {
      PUT_STR( (int *)"AND returning values\n");
    };
    op = 0;
    PUT_STR( (int *)"value of OP");
    PUT_NAT(op);
    PUT_STR( (int *)"\n");
  }
}

