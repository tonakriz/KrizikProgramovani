PROGRAM Prenos_p
  VAR_INPUT
  END_VAR
  VAR_OUTPUT
  END_VAR
  VAR
  END_VAR
  VAR_TEMP
  END_VAR
{NOCODE}
(*
  Koment�� ke sch�matu
*)

{NETWORK}
(*
  Koment�� k obvodu
*)
  LD_BOOL   "v1"
  ST        "vy1"
{/NETWORK}

{NETWORK}
(*

*)
  LDN_BOOL  "v2"
  ST        "vy2"
{/NETWORK}

{NETWORK}
(*

*)
  LD_EDGE   "v1"
  ST        "vy3"
{/NETWORK}


{/NOCODE}
{ILCODE}
(* Network 1 *)
(* 19 *)    LD_BOOL   v1
(* 20 *)    ST        vy1
(* Network 2 *)
(* 27 *)    LDN_BOOL  v2
(* 28 *)    ST        vy2
(* Network 3 *)
(* 35 *)    LD_EDGE   v1
(* 36 *)    ST        vy3
END_PROGRAM
{STCODE}

{DEBUG_INFO=
 19:43:0 20:44:0 27:46:0 28:47:0 35:49:0 36:50:0
}
