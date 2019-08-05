char * Bank_SocketServerP1[] = Bank_SocketServerPV1;
int Bank_SocketServerP2 = Bank_SocketServerPV2;
int Bank_SocketServerP3 = Bank_SocketServerPV3;

char * _in_buf;
long int _in_buf_size = Bank_SocketServerPV2;
long int _in_buf_ptr;
long int _in_buf_len;

char * _out_buf;
long int _out_buf_size = Bank_SocketServerPV3;
long int _out_buf_ptr;

int _num_sav;
char _sav_buf [ 256 ];
long int _sav_buf_ptr;

char * malloc_buf;
long int malloc_buf_len;
long int malloc_buf_ptr;
long int malloc_done;

