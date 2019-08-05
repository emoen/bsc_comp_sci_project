#include <stdio.h>

#include "file_dump.h"

void
open_write_dump_file()
{
	dump_file = fopen("TMP.file","w");
}


void
open_read_dump_file()
{
	dump_file = fopen("TMP.file","r");
}


void
close_dump_file()
{
	fclose(dump_file);
}
