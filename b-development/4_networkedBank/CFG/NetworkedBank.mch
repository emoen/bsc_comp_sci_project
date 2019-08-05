/*
It becomes problematic to call operations within a machine
because one must make sure that the preconditions are preserved 
when the operation is called. It is not even allowed by the toolkit

I have had to substitue ff : seq(NAT) with xx and yy because
ff gave problems in operation ATM_XXX because ff(1) := ??? ||
ff(2) := ??? gives the following analysis error 
"Repetition of 'ff' in left-hand side of substitution.
Surly this is too strong! Surely it must be allow to 
stor values in ff at two different slots. 

The modefication has made it unconvenient to add a
new operation to Bank.mach which has more than two 
parametres.

I can not use ff ether as follows
ATM_XXX
...
ff <- 'some parametre value> || 'will not work here
ff <- 'some parametre value>
....
check_clientreq
...
aa := ff(1) || 'Will not work here
ff := <>
...



Why is B such a diffecult language to learn:
One of the reason is that you need a firm knowledge
of the matematical notation and the method behind
b but there is also another reason. The syntax has many 
small oddeties to it and somethimes syntax you might think
is ok is not. For exampl '-0' anywhere in context of
NAT will give a parse error. The BToolkit also gives
poor feedback on errors. Therefore it takes long
time to learn B syntax. An example to show special 
rules of B is:A small example to illustrate this is from this
operation:
  status <-- ATM_create_account = 
	creq := creq <- 1 
It parses and analysises fine

  status <-- ATM_create_account = 
	creq := creq <- 1 ||
	status := TRUE;
You should think that this would also work fine
but it does not and should be modified as follows

  status <-- ATM_create_account = 
	BEGIN
	creq := creq <- 1 ||
	status := TRUE
	END;

It is also diffecult to learn B
because it requires a different mind-set than when
you hack away on your average java or c program.

Another obscurity: 
you initialize a sequence with <{something}>, but inside
the operatinos you denote sequences with [{something}]
*/
MACHINE		NetworkedBank

INCLUDES 	Bank

SEES		Bool_TYPE

DEFINITIONS
	maxParams == 100;
	maxReq == 33

VARIABLES 
	ff,creq

INVARIANT
	ff : seq(NAT) &
	creq : seq(NAT) &
	size(ff) <= maxParams 

INITIALISATION
	 creq, ff := <>, <>

OPERATIONS

  status <-- ATM_create_account = 
	BEGIN
		creq := creq <- 1 ||
		status := TRUE
	END;

  status <-- ATM_deposit(acc, amount) =
	PRE 		
		acc : accountNumber & 
		amount : NAT1 
	THEN
		IF size(ff) <= maxParams - 2 & size(ff) < maxReq THEN
			creq := creq <- 2 ||
			ff := ff <+ {card(ff)+1 |-> acc, card(ff)+2 |-> amount} ||
/*			ff := ff ^ [acc, amount] ||*/
			status := TRUE
		ELSE
			status := FALSE
		END
	END;

  status <-- ATM_withdraw(acc, amount)=
	PRE 		
		acc : accountNumber & 
		amount : NAT1 
	THEN
		IF size(ff) <= maxParams - 2 & size(ff) < maxReq THEN
			creq := creq <- 3 ||
/*		ff := ff ^ {card(ff)+1 |-> acc, card(ff)+2 |-> amount} ||*/
			ff := ff ^ [acc, amount] ||
			status := TRUE
		ELSE 	status := FALSE
		END
	END;

  status <--  ATM_isaccount(acc)=
	PRE 		
		acc : accountNumber 
	THEN
		IF size(ff) <= maxParams - 2 & size(ff) < maxReq THEN
			creq := creq <- 4 ||
/*		ff := ff ^ {card(ff)+1 |-> acc} ||*/
			ff := ff ^ [acc] ||
			status := TRUE
		ELSE	status := FALSE
		END
	END;

  status <-- ATM_getbalance(acc) =
	PRE 		
		acc : accountNumber   
	THEN
		IF size(ff) <= maxParams - 2 & size(ff) < maxReq THEN
			creq := creq <- 5 ||
/*		ff := ff ^ {card(ff)+1 |-> acc} ||*/
			ff := ff ^ [acc] ||
			status := TRUE
		ELSE	status := FALSE
		END
	END;


  num, ok, op  <-- check_clientreq =
	IF card(creq) > 0 THEN
	VAR aa, bb IN
		IF last(creq) = 1 THEN
			creq := front(creq) ||
			num, ok <-- create_account ||
			op := 1
		ELSE IF last(creq) = 2 THEN
			creq := front(creq) ||
			aa := ff(card(ff)-1) ||
			bb := ff(card(ff)) ||
			ff := ff /|\ (card(ff) - 2) ||
			ok, num <-- deposit(aa, bb) ||
			op := 2
		ELSE IF last(creq) = 3 THEN
			creq := front(creq) ||
			aa := ff(card(ff)-1) ||
			bb := ff(card(ff)) ||
			ff := ff /|\ (card(ff) - 2) ||
			ok <-- withdraw(aa, bb) ||
			num := 0 ||
			op := 3
		ELSE IF last(creq) = 4 THEN
			creq := front(creq) ||
			aa := ff(card(ff)) ||
			ff := tail(ff) ||
			ok <-- isaccount(aa) ||
			num := 0 ||
			op := 4
		ELSE IF last(creq) = 5 THEN
			creq := front(creq) ||
			aa := ff(card(ff)) ||
			ff := tail(ff) ||
			num <-- getbalance(aa) ||
			ok := FALSE ||
			op := 5
		END
		END
		END
		END
		END
	END
	END
END
