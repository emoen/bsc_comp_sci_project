MACHINE           
	Protocol

SEES 
	Bool_TYPE, CommsDefs, Globals

INCLUDES
	Client, Server,
	cliserv.Buffer(MESSAGES, buffsize),
	servcli.Buffer(MESSAGES, buffsize)

VARIABLES         
	pstate

INVARIANT
	pstate : STATE

INITIALISATION
	pstate := idle

OPERATIONS

  pinit =
		BEGIN
			pstate := idle ||
			sinit || cinit ||
			cliserv.binit ||
			servcli.binit
		END;
		
	ok1, ok2, ok3 <-- pconrq = 
		IF
			pstate = idle
		THEN
			ok1 := TRUE ||
			pstate := conp ||
			ok2 <-- conrq ||
			ok3 <-- cliserv.add(con)
		ELSE
			ok1 := FALSE
		END;
		
	ok1, ok2, ok3 <-- pconin = 
		IF
			pstate = conp
		THEN
			ok2 <-- cliserv.remove ||
			ok3 <-- conin ||
			pstate := conpp ||
			ok1 := TRUE
		ELSE	
			ok1 := FALSE
		END;
		
	ok1, ok2, ok3 <-- pconrp = 
		IF 
			pstate = conpp 
		THEN
			ANY 
				pp
			WHERE
				pp : BOOL 
			THEN
				ok2 <-- servcli.add(conr) ||
				ok3 <-- conrp(pp) ||
				pstate := concfp ||
				ok1 := TRUE
			END
		ELSE
			ok1 := FALSE
		END;
			
	ok1, ok2, ok3 <-- pconcf = 
		IF 
			pstate = concfp 
		THEN
			IF 
				sstate = connected 
			THEN
				ok2 <-- concf(TRUE) ||
				pstate := connected
			ELSE
				ok2 <-- concf(FALSE) ||
				sinit ||
				pstate := idle
			END || /*why must i have this?? ugly!*/
				ok1 := TRUE ||
				ok3 <-- servcli.remove
		ELSE
			ok1 := FALSE
		END;
		
		ps <-- prot_state =
			BEGIN
				ps := pstate
			END;
			
	aa <-- pcreate_acc(balance) =
		PRE
			balance : NAT	&
			pstate = connected			
		THEN
			aa <-- screate_acc(balance)
		END;
		
	/*new <-- pdeposit(acc, amount) =
		PRE
			acc : NAT & amount : NAT &
			sstate = connected		
		THEN
			new <-- sdeposit(acc, amount)
		END;
		*/
		
	ans <-- pwithdraw(acc, amount) =
		PRE
			acc : NAT1 & amount : NAT1 &
			pstate = connected
		THEN
			ans <-- swithdraw(acc, amount)
		END;
		
	rr <-- pisaccount(acc) =
		PRE
			acc : NAT &
			sstate = connected			
		THEN
			rr <-- sisaccount(acc)
		END
END
