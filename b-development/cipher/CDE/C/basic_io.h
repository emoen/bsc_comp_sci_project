#include <stdio.h>

extern FILE * _b;

#define INI_basic_io()       { _b = stdout; }

#define GET_NAT(r)           GET_NBR ( r, 2147483646 )

#define GET_PROMPT_NAT(r,s)  GET_PROMPT_NBR ( r, s, 2147483646 )

#define PUT_NBR_PAD(n,p)     PUT_NAT_PAD ( n, p )

#define GET_INT(r)           GET_ITGR ( r, -2147483647, +2147483646 )

#define GET_PROMPT_INT(r,s)  GET_PROMPT_ITGR ( r, s, -2147483647, +2147483646 )

#define PUT_INT_PAD(n,p)     PUT_ITGR_PAD ( n, p )

#define _lib_GET_TOK(t)           GET_NAT ( t )

#define _lib_GET_PROMPT_TOK(t,s)  GET_PROMPT_NAT ( t, s )

#define _lib_PUT_TOK(t)           PUT_NAT ( t )

#define PUT_STR_PAD(s,p)     PUT_STR ( s ); \
                             BLK ( p - strlen ( ( char * ) s ) )

#define PUT_BOOL_PAD(b,p)    PUT_BOOL(b); \
                             if   ( b ) BLK ( p - 4 ); \
                             else       BLK ( p - 5 )

#define PUT_EOT()            PUT_CHR ( '\004' )


#ifndef _BT_Motif


#define PUT_NAT(n)           fprintf ( _b, "%d", n )

#define PUT_NBR(n)           PUT_NAT ( n )

#define PUT_INT(n)           if ( n >= 0 ) fprintf ( _b, "+" ); PUT_NAT ( n )

#define PUT_CHR(c)           fprintf ( _b, "%c", ( char ) c )

#define PUT_STR(s)           fprintf ( _b, ( char * ) s )

#define PUT_BOOL(b)          if   ( b )  PUT_STR ( "TRUE" ); \
                             else        PUT_STR ( "FALSE" )

#define FLSH()               fflush( stdout)

#define GET_STR(s)           gets ( ( char * ) s )

#define GET_PROMPT_STR(s,t)  PUT_STR ( ( char * ) t ); gets ( ( char * ) s )

#define _lib_PUT_ACT_TOK(T,t) \
  if ( T [ 0 ] [ 0 ] == '\0' ) { \
    PUT_STR ( T [ t ] ); \
  } \
  else { \
    if ( ( strcmp ( T [ 0 ], "SCALAR" ) != 0 )        && \
         ( strcmp ( T [ 0 ], "0..2147483646" ) != 0 )    ) { \
      PUT_STR( T [ 0 ] ); PUT_CHR ('.'); \
    } \
    PUT_NAT ( t ); \
  }

#define _lib_GET_PROMPT_ACT_TOK(t,T,s) \
  PUT_STR ( s ); \
  _lib_GET_ACT_TOK (t, T )

#else

extern void NWL_M ();
extern void BLK_M ();
extern void PUT_NAT_M ();
extern void PUT_INT_M ();
extern void PUT_STR_M ();
extern void PUT_CHR_M ();
extern void PUT_BTS_M ();
extern void PUT_BOOL_M ();
extern void GET_PROMPT_NBR_M ();
extern void GET_PROMPT_ITGR_M ();
extern void GET_PROMPT_STR_M ();
extern void GET_PROMPT_CHR_M ();
extern void GET_PROMPT_BTS_M ();
extern void GET_PROMPT_BOOL_M ();
extern void PUT_ACT_TOK_M ();
extern void GET_ACT_TOK_M ();
extern void GET_SET_ACT_TOK_M ();
extern void GET_SET_TOK_M ();

#define PUT_STR(s)           PUT_STR_M ( s )

#define PUT_CHR(c)           PUT_CHR_M ( c )

#define PUT_NAT(n)           PUT_NAT_M ( n )

#define PUT_NBR(n)           PUT_NAT ( n )

#define PUT_INT(n)           PUT_INT_M ( n )

#define PUT_BOOL(b)          PUT_BOOL_M ( b )

#define FLSH()               ;

#define GET_STR(s)           GET_PROMPT_STR ( s, "        Input string:     " )


#define _lib_PUT_ACT_TOK(T,t) \
  if ( T [ 0 ][ 0 ] == '\0' ) \
    PUT_ACT_TOK_M ( T, t ); \
  else \
    _lib_PUT_TOK ( t )

#define _lib_GET_ACT_TOK(t,T) \
  if ( T [ 0 ][ 0 ] == '\0' ) \
    GET_ACT_TOK_M ( T, t, "      Select token:     " ); \
  else \
    _lib_GET_TOK ( t )

#define _lib_GET_PROMPT_ACT_TOK(t,T,s) \
  if ( T [ 0 ][ 0 ] == '\0' ) \
    GET_ACT_TOK_M ( T, t, s ); \
  else \
    _lib_GET_PROMPT_TOK ( t, s )

#define _lib_GET_SET_ACT_TOK(m,t,T) \
  if ( T [ 0 ][ 0 ] == '\0' ) \
    GET_SET_ACT_TOK_M ( T, m, t ); \
  else \
    GET_SET_TOK_M ( T, m, t )

#endif

#ifndef _BT_Motif

#define REDIR_stdout(r,f)  * r = ( ( ( _b = fopen ( ( char * ) f, "w" ) ) != NULL ) != 0 )

#define REAPP_stdout(r,f)  * r = ( ( ( _b = fopen ( ( char * ) f, "a" ) ) != NULL ) != 0 )

#define RESTR_stdout(r)    * r = ( ( fclose ( _b ) == 0 ) != 0 ); _b = stdout

#else

#define REDIR_stdout(r,f)    * r = FALSE

#define REAPP_stdout(r,f)    * r = FALSE

#define RESTR_stdout(r)      * r = FALSE

#endif


void NWL ();
void BLK ();
void GET_NBR ();
void GET_PROMPT_NBR ();
void GET_ITGR ();
void GET_PROMPT_ITGR ();
void GET_BOOL ();
void GET_PROMPT_BOOL ();
void GET_BTS ();
void GET_PROMPT_BTS ();
void PUT_BTS ();
void GET_CHR ();
void GET_PROMPT_CHR ();
void PUT_NAT_PAD ();
void PUT_ITGR_PAD ();

#ifndef _BT_Motif

void _lib_GET_ACT_TOK ();
void _lib_GET_SET_ACT_TOK ();

#else

void GET_PROMPT_STR();

#endif
