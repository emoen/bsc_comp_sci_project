#include "Arithmetic.h"

void
INI_Arithmetic()
{
  ;
}

void
exp_op(_rr,_aa , _bb)
int *_rr,_aa,_bb;
{
  if ( _aa != 0 || _bb != 0 ) {
    int ii,kk;
    ii = _bb;
    kk = 1;
    while ( ii != 0 ) {
      kk = kk*_aa;
      ii = ii-1;
    };
    *_rr = kk;
  }
}

