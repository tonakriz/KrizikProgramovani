PROGRAM vykony4cst_p
// VARS
  VAR_INPUT
  END_VAR
  VAR_OUTPUT
  END_VAR
  VAR
  h1 : int;
  h2 : int;
  h3 : int;
  h4 : int;
  h : int;
  END_VAR
  VAR_TEMP
  END_VAR
// END VARS
// CODE
  IF s1 THEN
     h1 := 1;
  END_IF;
  IF s2 THEN
     h2 := 4;
  END_IF;
  IF s3 THEN
     h3 := 7;
  END_IF;
  IF s4 THEN
     h4 := 9;
  END_IF;
  
  
  h := h1 + h2 + h3 + h4;
  IF h <= 10 THEN
     splneno := true;
  END_IF;
// END CODE
END_PROGRAM

