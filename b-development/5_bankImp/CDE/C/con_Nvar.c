#include "con_Nvar.h"

#include <stdio.h>
#include <sys/types.h>
#include <netinet/in.h>

extern FILE *dump_file;


#define  write_fm(a,b)    fwrite(&a,sizeof(int),b,dump_file)

void
con_SAV_NVAR()
{
	write_fm(con_Nscv,1);
}

void
con_SAVN_NVAR()
{
	con_Nscv = htonl ( con_Nscv );
	write_fm(con_Nscv,1);
	con_Nscv = ntohl ( con_Nscv );
}


#define  read_fm(a,b)    fread(&a,sizeof(int),b,dump_file)

void
con_RST_NVAR()
{
	read_fm(con_Nscv,1);
}

void
con_RSTN_NVAR()
{
	read_fm(con_Nscv,1);
	con_Nscv = ntohl ( con_Nscv );
}
