MACHINE           
	Protocol

SEES 
	Bool_TYPE, CommsDefs

INCLUDES
	Client, Server,
	client.Buffer(MESSAGES, buffsize),
	server.Buffer(MESSAGES, buffsize)

VARIABLES         
	p_state, report

INVARIANT
	p_state : STATE &
	report : BOOL

INITIALISATION
	p_state, report := idle, FALSE

OPERATIONS

  pinit =
	BEGIN
		p_state := idle ||
		client.binit ||
		server.binit
	END;
		
/* request for server from client */
  ok_protocol, ok_client, ok_buffer <-- pcon_request = 
	IF p_state = idle THEN
		p_state := conpending ||
		ok_protocol := TRUE ||
		ok_client <-- client_con_request ||
		ok_buffer <-- client.add(con)
	ELSE	ok_protocol := FALSE
	END;

/* server receives request*/
  ok_protocol, ok_server, ok_buffer <-- pcon_in = 
	IF p_state = conpending THEN
		p_state := conrequest ||
		ok_protocol := TRUE ||
		ok_server <-- conin ||
		ok_buffer <-- client.remove 
	ELSE	ok_protocol := FALSE
	END;

/* server decides accepts/declines request */
  ok_protocol, ok_server, ok_buffer <-- pcon_report = 
	IF p_state = conrequest THEN
		p_state := have_report ||
		report <-- server_con_report ||
		
		ok_protocol := report ||
		ok_server := report ||
		IF report = TRUE THEN
			ok_buffer <-- server.add(true)
		ELSE ok_buffer <-- server.add(false) 
		END
	ELSE	ok_protocol := FALSE
	END;
	
/* protocol replies to requset */
  ok_protocol, ok_client, ok_buffer <-- pcon_give_report = 
	BEGIN
		ok_client <-- client_con_report(report) ||
		IF p_state = have_report THEN
			IF report = TRUE THEN
				p_state := connected 
			ELSE
				sinit ||
				p_state := idle
			END || 
			ok_protocol := TRUE ||
			ok_buffer <-- server.remove
		ELSE	ok_protocol := FALSE
		END
	END;
		
  ps <-- prot_state =	
	ps := p_state

END
