#include "Bank.h"

#include "accNr_Narr.h"
#include "count_Nvar.h"

#include "Bool_TYPE.h"

void
INI_Bank()
{
  INI_accNr_Narr();
  INI_count_Nvar();
  count_STO_NVAR(0);
}

void
create_account(_accNr , _rep)
int *_accNr,*_rep;
{
  int ii,ok;
  count_VAL_NVAR(&ii);
  ii = ii+1;
  if ( ii <= maxAccounts ) {
    accNr_STO_NARR(ii,0);
    count_STO_NVAR(ii);
    *_accNr = ii;
    *_rep = TRUE;
  }
  else {
    *_accNr = 0;
    *_rep = FALSE;
  }
}

void
deposit(_ok , _newBalance,_acc , _amount)
int *_ok,*_newBalance,_acc,_amount;
{
  int ii;
  count_VAL_NVAR(&ii);
  if ( _acc <= ii && _acc <= maxAccounts && _amount > 0 ) {
    int curBal;
    accNr_VAL_NARR(&curBal,_acc);
    *_newBalance = curBal+_amount;
    accNr_STO_NARR(_acc,*_newBalance);
    *_ok = TRUE;
  }
  else {
    *_ok = FALSE;
    *_newBalance = 0;
  }
}

void
withdraw(_ok,_acc , _amount)
int *_ok,_acc,_amount;
{
  int ii;
  count_VAL_NVAR(&ii);
  if ( _acc <= ii && _acc <= maxAccounts && _amount > 0 ) {
    int curBal;
    accNr_VAL_NARR(&curBal,_acc);
    if ( curBal-_amount >= 0 ) {
      accNr_STO_NARR(_acc,curBal-_amount);
      *_ok = TRUE;
    }
  }
  else {
    *_ok = FALSE;
  }
}

void
isaccount(_rr,_acc)
int *_rr,_acc;
{
  int ii;
  count_VAL_NVAR(&ii);
  if ( _acc <= ii ) {
    *_rr = TRUE;
  }
  else {
    *_rr = FALSE;
  }
}

void
getbalance(_bal,_acc)
int *_bal,_acc;
{
  int ii;
  count_VAL_NVAR(&ii);
  if ( _acc <= ii ) {
    accNr_VAL_NARR(_bal,_acc);
  }
  else {
    *_bal = 0;
  }
}

