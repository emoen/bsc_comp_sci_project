
extern char * _ServeBankIo_ServeBank_Ops [];

#define ServeBank_Ops _ServeBankIo_ServeBank_Ops

#define ServeBank_Menu_OP 1
#define startServer_OP 2
#define listenForUser_OP 3
#define Quit_OP 4

void INI_ServeBankIo();
void ServeBank_Menu();
void Get_ServeBank_Op();
