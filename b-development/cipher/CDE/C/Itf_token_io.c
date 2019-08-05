#include "Itf_token_io.h"

#ifndef _BT_Motif

void
#ifdef _BT_ANSIC
Itf_GET_ACT_TOK( int * t, char * * T )
#else
Itf_GET_ACT_TOK( t, T )
int * t;
char * * T;
#endif
{
  int n,i,j;
  char u [ 50 ];
  int done = 0;
  if ( T [ 0 ] [ 0 ] != '\0' )  { 
      GET_NAT ( &n );
  }
  else {
    i = 1;
    while( T [ i ] [ 0 ] != '_' ) i++;
    j = 0;
    while ( T [ i ] [ j + 1 ] != '\0' && j < 50 ) {
      u [ j ] = T [ i ] [ j + 1 ];
     j++;
    }
    u [ j ] = '\0';
    while( ! done ) {
      i = 1;
      printf( "\n" );
      while( T [ i ] [ 0 ] != '_' ){
        BLK ( 8 ); PUT_STR ( u ); PUT_STR ( "." );
        PUT_NAT_PAD ( i, 4 ); PUT_STR ( T [ i ] ); NWL ( 1 );
        i++;
      }
      BLK ( 4 ); PUT_STR ( u ); PUT_STR ( " value " );
      PUT_STR ( " (1.." ); PUT_NAT ( i - 1 ); PUT_STR ( "): "); FLSH ();
      GET_NAT ( &n );
      if   ( n >= 1 && n <= i - 1 ) { done = 1; }
      else                          { BLK(15); PUT_STR (" Bad input!" ); }
    }
  }
  *t = n; 
}

#endif
