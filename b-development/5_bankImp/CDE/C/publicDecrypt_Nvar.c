#include "publicDecrypt_Nvar.h"

#include <stdio.h>
#include <sys/types.h>
#include <netinet/in.h>

extern FILE *dump_file;


#define  write_fm(a,b)    fwrite(&a,sizeof(int),b,dump_file)

void
publicDecrypt_SAV_NVAR()
{
	write_fm(publicDecrypt_Nscv,1);
}

void
publicDecrypt_SAVN_NVAR()
{
	publicDecrypt_Nscv = htonl ( publicDecrypt_Nscv );
	write_fm(publicDecrypt_Nscv,1);
	publicDecrypt_Nscv = ntohl ( publicDecrypt_Nscv );
}


#define  read_fm(a,b)    fread(&a,sizeof(int),b,dump_file)

void
publicDecrypt_RST_NVAR()
{
	read_fm(publicDecrypt_Nscv,1);
}

void
publicDecrypt_RSTN_NVAR()
{
	read_fm(publicDecrypt_Nscv,1);
	publicDecrypt_Nscv = ntohl ( publicDecrypt_Nscv );
}
