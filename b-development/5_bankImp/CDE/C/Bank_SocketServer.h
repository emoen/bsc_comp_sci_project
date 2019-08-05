#include <sys/types.h>
#include <sys/file.h>
#include <sys/stat.h>
#include <sys/signal.h>
#include <sys/socket.h>
#include <sys/resource.h>
#include <sys/wait.h>
#include <sys/time.h>
#include <sys/utsname.h>
#include <sys/ioctl.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <fcntl.h>
#include <netdb.h>
#include <syslog.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <signal.h>
#include <errno.h>

#ifndef LOCK_EX
#define LOCK_EX 2
#endif /* LOCK_EX - exclusive lock */

#ifndef LOCK_NB
#define LOCK_NB 4
#endif /* LOCK_NB - Don't block when locking */



extern char * Bank_SocketServerP1[];
extern int Bank_SocketServerP2;
extern int Bank_SocketServerP3;

extern char * _out_buf;
extern long int _out_buf_size;
extern long int _out_buf_ptr;

extern char * _in_buf;
extern long int _in_buf_size;
extern long int _in_buf_ptr;
extern long int _in_buf_len;

extern int _num_sav;
extern char _sav_buf [];
extern long int _sav_buf_ptr;

extern char * malloc_buf;
extern long int malloc_buf_len;
extern long int malloc_buf_ptr;
extern long int malloc_done;

#define INI_Bank_SocketServer()   { _out_buf_ptr = 4; _in_buf_ptr = 4; }

void Bank_INIT ( int * _rep, void * _lockfile, int _port , void * _bufsavefile );
void Bank_ACCEPT ( int * _rep );
void Bank_READ ( int * _rep, int * _pp );
void Bank_WRITE ( int * _rep );
void Bank_CLOSE ( int * _rep );
void Bank_GET_TOK ( int * _tok, int _toksize );
void Bank_GET_STR ( int * _ss );
void Bank_PUT_TOK ( int _tok, int _toksize );
void Bank_PUT_STR ( int * _ss );
void Bank_SET_IN_PTR ( int _ptr );
void Bank_GET_IN_PTR ( int * _ptr );
void Bank_SET_OUT_PTR ( int _ptr );
void Bank_GET_OUT_PTR ( int * _ptr );
void Bank_GET_OUT_SIZE ( int * _sz );
void Bank_PUT_FILE ( int * _rep, void * _filename );
void Bank_SAV_BUF ( int * _rep, int * _num_saves );
void Bank_SAV_RMV ( void );
void Bank_RST_BUF ( int * _rep );
void Bank_NXT_BUF ( int * _rep );
