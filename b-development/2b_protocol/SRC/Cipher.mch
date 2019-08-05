MACHINE	
	Cipher

SETS
	MSG

CONSTANTS
	aa, ee, dd, nn, msg, gcd, fi, pow
	
PROPERTIES
	aa : NAT1 &
/* <because ee, dd : NAT and not NAT1 i get following warning:>
			<CONSTANT ee not set in specification> */
	ee : NAT &  
	dd : NAT &
	msg : MSG &
	nn : NAT1 &
	fi : NAT1 --> NAT1 &
	gcd : (NAT * NAT) +-> NAT &
	
/*	tmp : (NAT * NAT)  - {0 |-> 0} <problems giving type to tmp>*/ 
/*	pow : tmp --> NAT  <cant type "pow" as pow(?*NAT)>!? */

	pow : (NAT * NAT) --> NAT &
	pow(0, aa) = 0 &
	pow(aa, 0) = 1 & 
	
/*	pow(0, 0) = {} <pow : (NAT*NAT*NAT)> & */

	gcd(ee, nn) = gcd(ee, ee mod nn) &

	/* These next statements are not essential */
	gcd(ee, 0) = ee &
	gcd(0, 0) = 0


OPERATIONS
	new_msg <-- encrypt(mm) =
		PRE
			mm : NAT1 
		THEN
			new_msg := pow(mm, ee) mod nn
		END;
		
	new_msg <-- decrypt(mm) =
		PRE
			mm : NAT1
		THEN
			new_msg := pow(mm, dd) mod nn
		END
END
