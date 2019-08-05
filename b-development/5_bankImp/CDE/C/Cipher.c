#include "Cipher.h"

#include "Arithmetic.h"

void
INI_Cipher()
{
  INI_Arithmetic();

}

void
encrypt_op(_rr,_mm)
int *_rr,_mm;
{
  int tmp;
  exp_op(&tmp,_mm,CipherP1);
  *_rr = tmp % CipherP3;
}

void
decrypt_op(_rr,_mm)
int *_rr,_mm;
{
  int tmp;
  exp_op(&tmp,_mm,CipherP1);
  *_rr = tmp % CipherP3;
}

