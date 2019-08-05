MACHINE         Itf_token_io(TOKEN)

SEES            String_TYPE

OPERATIONS


  /* operations deal with scalars */

  tt <-- Itf_GET_TOK = 
    BEGIN
      tt :: TOKEN           /* reads a token (0..2147483646) */
    END;

  tt <-- Itf_GET_PROMPT_TOK(ss : STRING) = 
    BEGIN
      tt :: TOKEN           /* prompts for a token (0..2147483646) */
    END;

   Itf_PUT_TOK(tt : TOKEN) = 
    BEGIN skip END;         /* printed as tt */



  /* operations deal with enumerated elements */

 tt <-- Itf_GET_ACT_TOK(SS : POW(TOKEN)) = 
    BEGIN
      tt :: SS             /* gets a token (by presenting a list) */
    END;

  tt <-- Itf_GET_PROMPT_ACT_TOK(SS : POW(TOKEN) & ss : STRING) = 
    BEGIN
      tt :: TOKEN           /* prompts for a token(by presenting a list) */
    END;

  Itf_PUT_ACT_TOK(SS : POW(TOKEN) & tt : SS) =
    BEGIN skip END          /* actual value printed if possible, else tt(SS) */

END
