MACHINE           
	Buffers(maxbuff)

SETS
	MESSAGE

VARIABLES
	leftbuf, rightbuf

INVARIANT         
	leftbuf: seq(MESSAGE) &
	rightbuf: seq(MESSAGE) &
	size(leftbuf) <= maxbuff &
	size(rightbuf) <= maxbuff

INITIALISATION    
	leftbuf := <> || rightbuf := <>

OPERATIONS
	push(xx) =
		PRE
			xx: MESSAGE &
			size(leftbuf) < maxbuff
		THEN
			leftbuf := [xx] ^ leftbuf
		END;
	
	shift = 
		PRE
			size(rightbuf) < maxbuff &
			leftbuf /= <>
		THEN
			LET hd
			BE hd = last(leftbuf)
			IN
				rightbuf := [hd] ^rightbuf ||
				leftbuf := front(leftbuf)
			END
		END;
		
	ss <-- left_length =
		ss := size(leftbuf);
		
	mm <-- pull =
		PRE
			rightbuf /= <>
		THEN
			ANY mm
			WHERE mm : MESSAGE
			THEN
				mm := [last(rightbuf)] ||
				rightbuf := front(rightbuf)
			END
		END
END

