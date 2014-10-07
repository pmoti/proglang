(* is_older tests *)

(* YEAR TESTS *)
val ioyt1 = is_older((2000,1,4),(2001,2,6)) = true
val ioyt2 = is_older((2000,3,4),(2001,2,6)) = true
val ioyt3 = is_older((2000,1,4),(2001,2,1)) = true
val ioyt4 = is_older((2000,3,4),(2001,2,6)) = true

val ioyt6 = is_older((2002,1,4),(2001,2,6)) = false
val ioyt7 = is_older((2002,3,4),(2001,2,6)) = false
val ioyt8 = is_older((2002,1,4),(2001,2,1)) = false
val ioyt9 = is_older((2002,3,4),(2001,2,6)) = false

(* MONTH TESTS *)
val iomt1 = is_older((2000,5,4),(2000,6,6)) = true
val iomt2 = is_older((2000,5,4),(2000,6,1)) = true
val iomt3 = is_older((2000,10,4),(2000,1,6)) = false
val iomt4 = is_older((2000,10,4),(2000,1,1)) = false

(* DAY TESTS *)
val iodt1 = is_older((2000,6,4),(2000,6,6)) = true 
val iodt2 = is_older((2000,6,4),(2000,6,1)) = false

(* EQUAL TEST *)
val ioet1 = is_older((2000,16,4),(2000,16,4)) = false

(* number_in_month tests *)
val nimt1 = number_in_month([(2014,10,1)

