#include "count_Nvar.h"

#include <stdio.h>
#include <sys/types.h>
#include <netinet/in.h>

extern FILE *dump_file;


#define  write_fm(a,b)    fwrite(&a,sizeof(int),b,dump_file)

void
count_SAV_NVAR()
{
	write_fm(count_Nscv,1);
}

void
count_SAVN_NVAR()
{
	count_Nscv = htonl ( count_Nscv );
	write_fm(count_Nscv,1);
	count_Nscv = ntohl ( count_Nscv );
}


#define  read_fm(a,b)    fread(&a,sizeof(int),b,dump_file)

void
count_RST_NVAR()
{
	read_fm(count_Nscv,1);
}

void
count_RSTN_NVAR()
{
	read_fm(count_Nscv,1);
	count_Nscv = ntohl ( count_Nscv );
}
