MACHINE          ArithmeticIo

SETS

  Arithmetic_Ops = {Arithmetic_Menu_OP,exp_op_OP,Quit_OP}

OPERATIONS

  Arithmetic_Menu = BEGIN skip END;  

  op<--Get_Arithmetic_Op = BEGIN op::Arithmetic_Ops END

END
