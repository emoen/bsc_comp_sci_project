MACHINE           
	Arithmetic

CONSTANTS
	gcd, prime, exp

PROPERTIES
	gcd : NAT * NAT --> NAT &
	
	exp : (NAT * NAT) +-> NAT & 

	!(aa,bb).(aa : NAT & bb : NAT1 => exp(aa, bb) = exp(aa, bb-1) * aa & 
	exp(aa,1) = aa &
	exp(bb, 0) = 1 &
	exp(0, bb) = 0 ) & 

	prime <: NAT 
	
/* NOT NEEDED */	
/*
	!ff.(ff : NAT1 => !gg.(gg : NAT1 => gcd(ff, gg) = gcd(ff, ff mod gg))) &
	!ff.(ff : NAT1 => gcd(ff, 0) = ff) &
	gcd(0, 0) = 0 &

	fi : NAT1 --> NAT1 
*/

OPERATIONS

  rr <-- exp_op(aa, bb) = 
		PRE
			aa : NAT &
			bb : NAT
		THEN
			rr := exp(aa, bb)
		END
END
