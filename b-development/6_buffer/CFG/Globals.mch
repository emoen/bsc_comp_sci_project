MACHINE           Globals

CONSTANTS
	maxAccounts

PROPERTIES
/*because of the constraints of decrypt_op in
Cipher.mch maxAccounts must be less than n-1 => mxA < 7
*/
	maxAccounts = 6
/*maxAccounts should be in the range 0..4096. How do i express that?*/

DEFINITIONS
	ACCOUNTS == 1 .. maxAccounts;
	MAXINT == 5000; /*There may not be an account with more than 5000 on it!*/

/*Because Cipher can not be given in-parametres at runtime
I will have to define all cipher keys in this machine and so
jeperdising the securinty */

	ee_ser == 5;
	dd_ser == 17;
	nn == 7;
	ee_cli == 9;
	dd_cli == 11

/* matching pairs {5, 11, 7} and {9, 17, 7}*/
END
