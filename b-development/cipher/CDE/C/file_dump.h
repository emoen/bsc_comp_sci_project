#include <stdio.h>

extern FILE *dump_file;

#define INI_file_dump()          { ; }

void open_write_dump_file();
void open_read_dump_file();
void close_dump_file();
