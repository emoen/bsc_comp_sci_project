MACHINE           CipherB(ee, dd, nn)

CONSTRAINTS
	ee : NAT &
	dd : NAT &
	nn : NAT1 &
	ee*dd mod nn-1 = 1

VARIABLES         
	encrypt, decrypt

INVARIANT       
	encrypt : NAT-->NAT &
	decrypt : NAT-->NAT &
	!mm.(mm : 0 .. nn-1 => encrypt(decrypt(mm)) = mm) &
	!mm.(mm : 0 .. nn-1 => decrypt(encrypt(mm)) = mm) 


OPERATIONS

  rr <-- encrypt_op(mm)=
	PRE
		mm : 0 .. nn-1
	THEN
		rr := encrypt(mm)
	END

END
