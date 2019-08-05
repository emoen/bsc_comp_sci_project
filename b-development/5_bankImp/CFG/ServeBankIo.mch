MACHINE          ServeBankIo

SETS

  ServeBank_Ops = {ServeBank_Menu_OP,startServer_OP,listenForUser_OP,Quit_OP}

OPERATIONS

  ServeBank_Menu = BEGIN skip END;  

  op<--Get_ServeBank_Op = BEGIN op::ServeBank_Ops END

END
