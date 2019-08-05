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

#ifndef INADDR_NONE
#define INADDR_NONE  0xffffffff
#endif /* INADDR_NONE */

extern char * ATM_SocketClientP1[];
extern int ATM_SocketClientP2;
extern int ATM_SocketClientP3;

extern char * _out_buf;
extern int _out_buf_size;
extern int _out_buf_ptr;

extern char * _in_buf;
extern int _in_buf_size;
extern int _in_buf_ptr;
extern int _in_buf_len;


#define INI_ATM_SocketClient()   { _out_buf_ptr = 4; _in_buf_ptr = 4; }

void ATM_INIT ( int * _rep, void * _ipaddress, int _port );
void ATM_CONNECT ( int * _rep );
void ATM_WRITE ( int * _rep );
void ATM_READ ( int * _rep, int * _pp );
void ATM_CLOSE ( int * _rep );
void ATM_GET_TOK ( int * _tok, int _toksize );
void ATM_GET_STR ( int * _ss );
void ATM_GET_FIL ( int * _rep, int * _filesize, int * _filename );
void ATM_PUT_TOK ( int _tok, int _toksize );
void ATM_PUT_STR ( int * _ss );
void ATM_GET_IN_PTR ( int * _ptr );
void ATM_SET_IN_PTR ( int _ptr );
void ATM_GET_OUT_PTR ( int * _ptr );
void ATM_GET_OUT_SIZE ( int * _sz );
void ATM_SET_OUT_PTR ( int _ptr );
