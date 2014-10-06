(* is_older tests *)

(* YEAR TESTS *)
is_older((2000,15,4),(2001,16,6)) 

is_older((2000,15,4),(1999,16,6))  

(* MONTH TESTS *)
is_older((2000,5,4),(2000,16,6)) 

is_older((2000,16,4),(2000,1,6)) 

(* DAY TESTS *)
is_older((2000,16,4),(2000,16,6)) 

is_older((2000,16,4),(2000,16,1)) 


