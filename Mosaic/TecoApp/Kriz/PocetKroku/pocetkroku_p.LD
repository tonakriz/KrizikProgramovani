PROGRAM pocetkroku_p
  VAR_INPUT
  END_VAR
  VAR_OUTPUT
  END_VAR
  VAR
    citac : CTUD;
    dolu : BOOL;
    max : BOOL;
    min : BOOL;
    beh : BOOL;
    impulzy : BOOL;
    generator : TON;
    cas : TIME;
    started : BOOL;
    dobaStroje : TOF;
  END_VAR
  VAR_TEMP
  END_VAR
{NOCODE}
(*
  Koment�� ke sch�matu
*)

{NETWORK}
(*

*)
  LD_EDGE   "START"
  OR        "started"
  ANDN      "min"
  ST        "started"
{/NETWORK}

{NETWORK}
(*

*)
  LD_BOOL   "started"
  ANDN      "impulzy"
  {POU:TON} "generator"
    {PIN:IN} {/PIN}
    {PIN:PT} "T#1s" {/PIN}
    {PINO:Q} {/PIN}
    {PINO:ET} "cas" {/PIN}
  {/POU}
  ST        "impulzy"
{/NETWORK}

{NETWORK}
(*
  Koment�� k obvodu
*)
  LD_EDGE   "POCET"
  {POU:CTUD} "citac"
    {PIN:CU} {/PIN}
    {PIN:CD}
      LD_EDGE   "dolu"
    {/PIN}
    {PIN:R} {/PIN}
    {PIN:LD} {/PIN}
    {PIN:PV} "1000" {/PIN}
    {PINO:QU} {/PIN}
    {PINO:QD} "min" {/PIN}
    {PINO:CV} "hodnota" {/PIN}
  {/POU}
  ST        "max"
{/NETWORK}

{NETWORK}
(*

*)
  LD_BOOL   "started"
  {POU:NE}
    {PIN:EN} {/PIN}
    {PIN:IN1} "hodnota" {/PIN}
    {PIN:IN2} "0" {/PIN}
    {PINO:Q} {/PIN}
  {/POU}
  ST        "beh"
{/NETWORK}

{NETWORK}
(*

*)
  LD_BOOL   "beh"
  AND       "impulzy"
  OR(
    LD_EDGE   "KROK"
    ANDN      "started"
  )
  {POU:TOF} "dobaStroje"
    {PIN:IN} {/PIN}
    {PIN:PT} "T#0.5s" {/PIN}
    {PINO:Q} {/PIN}
    {PINO:ET} {/PIN}
  {/POU}
  ST        "STROJ"
  ANDN      "KROK"
  ST        "dolu"
{/NETWORK}


{/NOCODE}
{ILCODE}
(* Network 1 *)
(* 29 *)    LD_EDGE   START
(* 30 *)    OR        started
(* 31 *)    ANDN      min
(* 32 *)    ST        started
(* Network 2 *)
(* 39 *)    LD_BOOL   started
(* 40 *)    ANDN      impulzy
(* 42 *)    ST        generator.IN
(* 41 *)    CAL generator (PT:=T#1s)
(* 45 *)    LD        generator.ET
(* 45 *)    ST        cas
(* 44 *)    LD        generator.Q
(* 47 *)    ST        impulzy
(* Network 3 *)
(* 54 *)    LD_EDGE   POCET
{CREATE_TEMP=__Tmp_1}
(* 55 *)    ST        __Tmp_1
(* 58 *)    LD_EDGE   dolu
{CREATE_TEMP=__Tmp_2}
(* 57 *)    ST        __Tmp_2
(* 55 *)    CAL citac (CU:=__Tmp_1,CD:=__Tmp_2,R:=citac.R,LD:=citac.LD,PV:=1000)
(* 64 *)    LD        citac.QD
(* 64 *)    ST        min
(* 65 *)    LD        citac.CV
(* 65 *)    ST        hodnota
(* 63 *)    LD        citac.QU
(* 67 *)    ST        max
(* Network 4 *)
(* 74 *)    LD_BOOL   started
(* 76 *)    JMPCN __PouSkip_75
(* 75 *)    LD        hodnota
(* 78 *)    NE        0
(* 79 *)    __CR_TEST
(* 75 *)  __PouSkip_75:
(* 81 *)    ST        beh
(* Network 5 *)
(* 88 *)    LD_BOOL   beh
(* 89 *)    AND       impulzy
(* 90 *)    OR(
(* 91 *)      LD_EDGE   KROK
(* 92 *)      ANDN      started
(* 93 *)    )
(* 95 *)    ST        dobaStroje.IN
(* 94 *)    CAL dobaStroje (PT:=T#0.5s)
(* 97 *)    LD        dobaStroje.Q
(* 100 *)    ST        STROJ
(* 101 *)    ANDN      KROK
(* 102 *)    ST        dolu
END_PROGRAM
{STCODE}

{DEBUG_INFO=
 29:109:0 30:110:0 31:111:0 32:112:0 39:114:0 40:115:0 42:116:0 43:117:0 41:117:0
 45:119:0 44:120:0 47:121:0 54:123:0 58:126:0 56:129:1 57:129:2 60:129:0 61:129:0
 62:129:0 55:129:0 64:131:0 65:133:0 63:134:0 67:135:0 74:137:0 76:138:0 77:139:0
 78:140:0 79:141:0 81:143:0 88:145:0 89:146:0 91:148:0 92:149:0 93:150:0 95:151:0
 96:152:0 94:152:0 97:153:0 100:154:0 101:155:0 102:156:0
}
