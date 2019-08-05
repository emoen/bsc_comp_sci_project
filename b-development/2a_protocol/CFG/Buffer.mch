MACHINE           
	Buffer(ITEM, maxsize)

SEES
	Bool_TYPE

VARIABLES         
	contents
	
INVARIANT         
	contents : seq(ITEM) &
	size(contents) <= maxsize

INITIALISATION    
	contents := <>

OPERATIONS

	binit =
	BEGIN
		contents := <>
	END;		

	ok <-- add(ee) = 
		PRE
			ee : ITEM
		THEN
			IF size(contents) < maxsize
			THEN
				contents := contents <- ee ||
				ok := TRUE
			ELSE	
				ok := FALSE
			END
		END;
		
	ok, oo <-- initial =
		IF contents /= <>
		THEN
			oo := first(contents) ||
			ok := TRUE
		ELSE
			oo :: ITEM ||
			ok := FALSE
		END;
		
	ok <-- remove =
		IF contents /= <>
		THEN
			contents := tail(contents) ||
			ok := TRUE
		ELSE
			ok := FALSE
		END
END
