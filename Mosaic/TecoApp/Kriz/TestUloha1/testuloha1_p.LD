PROGRAM testuloha1_p
  VAR_INPUT
  END_VAR
  VAR_OUTPUT
  END_VAR
  VAR
    beh : BOOL;
    starter : BOOL;
    stoper : BOOL;
  END_VAR
  VAR_TEMP
  END_VAR
{NOCODE}
(*
Pohyb brusky
*)

{NETWORK}
(*
  Koment�� k obvodu
*)
  LD_BOOL   "START"
  AND       "polohaL"
  OR        "beh"
  ST        "starter"
{/NETWORK}

{NETWORK}
(*

*)
  LD_BOOL   "STOP"
  OR        "stoper"
  AND       "beh"
  ST        "stoper"
{/NETWORK}

{NETWORK}
(*

*)
  LD_BOOL   "starter"
  AND(
    LDN_BOOL  "stoper"
    OR(
      LD_BOOL   "stoper"
      ANDN      "polohaL"
    )
  )
  ST        "beh"
{/NETWORK}

{NETWORK}
(*

*)
  LD_BOOL   "beh"
  AND(
    LD_BOOL   "polohaL"
    OR        "pohybDoP"
  )
  ANDN      "polohaP"
  ST        "pohybDoP"
{/NETWORK}

{NETWORK}
(*

*)
  LD_BOOL   "beh"
  AND(
    LD_BOOL   "polohaP"
    OR        "pohybDoL"
  )
  ANDN      "polohaL"
  ST        "pohybDoL"
{/NETWORK}


{/NOCODE}
{ILCODE}
(* Network 1 *)
(* 22 *)    LD_BOOL   START
(* 23 *)    AND       polohaL
(* 24 *)    OR        beh
(* 25 *)    ST        starter
(* Network 2 *)
(* 32 *)    LD_BOOL   STOP
(* 33 *)    OR        stoper
(* 34 *)    AND       beh
(* 35 *)    ST        stoper
(* Network 3 *)
(* 42 *)    LD_BOOL   starter
(* 43 *)    AND(
(* 44 *)      LDN_BOOL  stoper
(* 45 *)      OR(
(* 46 *)        LD_BOOL   stoper
(* 47 *)        ANDN      polohaL
(* 48 *)      )
(* 49 *)    )
(* 50 *)    ST        beh
(* Network 4 *)
(* 57 *)    LD_BOOL   beh
(* 58 *)    AND(
(* 59 *)      LD_BOOL   polohaL
(* 60 *)      OR        pohybDoP
(* 61 *)    )
(* 62 *)    ANDN      polohaP
(* 63 *)    ST        pohybDoP
(* Network 5 *)
(* 70 *)    LD_BOOL   beh
(* 71 *)    AND(
(* 72 *)      LD_BOOL   polohaP
(* 73 *)      OR        pohybDoL
(* 74 *)    )
(* 75 *)    ANDN      polohaL
(* 76 *)    ST        pohybDoL
END_PROGRAM
{STCODE}

{DEBUG_INFO=
 22:83:0 23:84:0 24:85:0 25:86:0 32:88:0 33:89:0 34:90:0 35:91:0 42:93:0
 44:95:0 46:97:0 47:98:0 48:99:0 49:100:0 50:101:0 57:103:0 59:105:0 60:106:0
 61:107:0 62:108:0 63:109:0 70:111:0 72:113:0 73:114:0 74:115:0 75:116:0 76:117:0
}
