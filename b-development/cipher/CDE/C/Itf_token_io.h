#include "basic_io.h"

#define INI_Itf_token_io()       { ; }

#define Itf_GET_TOK(t)           GET_NAT ( t )

#define Itf_GET_PROMPT_TOK(t,s)  GET_PROMPT_NAT ( t, s )

#define Itf_PUT_TOK(t)           PUT_NAT ( t )

#ifndef _BT_Motif

#define Itf_PUT_ACT_TOK(T,t) \
  if ( T [ 0 ] [ 0 ] == '\0' ) { \
    PUT_STR( T [ t ] ); \
  } \
  else { \
    if ( ( strcmp ( T [ 0 ], "SCALAR" ) != 0 )        && \
         ( strcmp ( T [ 0 ], "0..2147483646" ) != 0 )    ) { \
      PUT_STR( T [ 0 ] ); PUT_CHR ('.'); \
    } \
    PUT_NAT ( t ); \
  }

#define Itf_GET_PROMPT_ACT_TOK(t,T,s) \
  PUT_STR ( s ); \
  Itf_GET_ACT_TOK (t, T )

#else

extern void PUT_ACT_TOK_M ();
extern void GET_ACT_TOK_M ();

#define Itf_PUT_ACT_TOK(T,t) \
  if ( T [ 0 ][ 0 ] == '\0' ) \
    PUT_ACT_TOK_M ( T, t ); \
  else \
    _lib_PUT_TOK ( t )

#define Itf_GET_ACT_TOK(t,T) \
  if ( T [ 0 ][ 0 ] == '\0' ) \
    GET_ACT_TOK_M ( T, t, "      Select token:     " ); \
  else \
    _lib_GET_TOK ( t )

#define Itf_GET_PROMPT_ACT_TOK(t,T,s) \
  if ( T [ 0 ][ 0 ] == '\0' ) \
    GET_ACT_TOK_M ( T, t, s ); \
  else \
    GET_PROMPT_TOK ( t, s )

#endif

#ifndef _BT_Motif

void Itf_GET_ACT_TOK ();

#endif
