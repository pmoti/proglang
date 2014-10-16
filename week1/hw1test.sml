(* is_older tests *)

(* YEAR TESTS *)
val ioyt1 = is_older((2000,1,4),(2001,2,6)) = true;
val ioyt2 = is_older((2000,3,4),(2001,2,6)) = true;
val ioyt3 = is_older((2000,1,4),(2001,2,1)) = true;
val ioyt4 = is_older((2000,3,4),(2001,2,6)) = true;

val ioyt6 = is_older((2002,1,4),(2001,2,6)) = false;
val ioyt7 = is_older((2002,3,4),(2001,2,6)) = false;
val ioyt8 = is_older((2002,1,4),(2001,2,1)) = false;
val ioyt9 = is_older((2002,3,4),(2001,2,6)) = false;

(* MONTH TESTS *)
val iomt1 = is_older((2000,5,4),(2000,6,6)) = true;
val iomt2 = is_older((2000,5,4),(2000,6,1)) = true;
val iomt3 = is_older((2000,10,4),(2000,1,6)) = false;
val iomt4 = is_older((2000,10,4),(2000,1,1)) = false;

(* DAY TESTS *)
val iodt1 = is_older((2000,6,4),(2000,6,6)) = true ;
val iodt2 = is_older((2000,6,4),(2000,6,1)) = false;

(* EQUAL TEST *)
val ioet1 = is_older((2000,16,4),(2000,16,4)) = false;

(* number_in_month tests *)
val nimt1 = number_in_month([(2014,10,1), (2014,10,2),(2014,3,1),(10,3,1),(10,1,1)], 10) = 2;
val nimt2 = number_in_month([(2014,10,1), (2014,10,2),(2014,3,1),(10,3,1),(10,1,1)], 3) = 2;
val nimt3 = number_in_month([(2014,10,1), (2014,10,2),(2014,3,1),(10,3,1),(10,1,1)], 9) = 0;

(* number_in_months tests *)
val nimst1 = number_in_months([(2014,10,1), (2014,10,2),(2014,3,1),(10,3,1),(10,1,1)], [10,4]) = 2;
val nimst2 = number_in_months([(2014,10,1), (2014,10,2),(2014,3,1),(10,3,1),(10,1,1)], [1,3,5,10]) = 5;

val nimst3 = number_in_months([(2014,10,1), (2014,10,2),(2014,3,1),(10,3,1),(10,1,1)], [14,1,3,23]) = 3;
val nimst4 = number_in_months([(2014,10,1), (2014,10,2),(2014,3,1),(10,3,1),(10,1,1)], [12,24,2]) = 0;

val nimst5 = number_in_months([(2014,10,1), (2014,10,2),(2014,3,1),(10,3,1),(10,1,1)], [9,3,2,6]) = 2;
val nimst6 = number_in_months([(2014,10,1), (2014,10,2),(2014,3,1),(10,3,1),(10,1,1)], [14,2,10,1]) = 3;

val nimst7 = number_in_months([(2014,10,1), (2014,10,2),(2014,3,1),(10,3,1),(10,1,1)], [14,1]) = 1;
val nimst8 = number_in_months([(2014,10,1), (2014,10,2),(2014,3,1),(10,3,1),(10,1,1)], [10,3]) = 4;

(* dates_in_month tests *)
val dimt1 = dates_in_month([(2014,10,1), (2014,10,2),(2014,3,1),(10,3,1),(10,1,1)], 10) = [(2014,10,1),(2014,10,2)];
val dimt2 = dates_in_month([(2014,10,1), (2014,10,2),(2014,3,1),(10,3,1),(10,1,1)], 3) = [(2014,3,1),(10,3,1)];
val dimt3 = dates_in_month([(2014,10,1), (2014,10,2),(2014,3,1),(10,3,1),(10,1,1)], 9) = [];

(* dates_in_months tests *)
val dimst1 = dates_in_months([(2014,10,1), (2014,10,2),(2014,3,1),(10,3,1),(10,1,1)], [10,4]) = [(2014,10,1),(2014,10,2)];
val dimst2 = dates_in_months([(2014,10,1), (2014,10,2),(2014,3,1),(10,3,1),(10,1,1)], [1,3,5,10]) = [(10,1,1),(2014,3,1),(10,3,1),(2014,10,1),(2014,10,2)];

val dimst3 = dates_in_months([(2014,10,1), (2014,10,2),(2014,3,1),(10,3,1),(10,1,1)], [14,1,3,23]) = [(10,1,1),(2014,3,1),(10,3,1)];
val dimst4 = dates_in_months([(2014,10,1), (2014,10,2),(2014,3,1),(10,3,1),(10,1,1)], [12,24,2]) = [];

val dimst5 = dates_in_months([(2014,10,1), (2014,10,2),(2014,3,1),(10,3,1),(10,1,1)], [9,3,2,6]) = [(2014,3,1),(10,3,1)];
val dimst6 = dates_in_months([(2014,10,1), (2014,10,2),(2014,3,1),(10,3,1),(10,1,1)], [14,2,10,1]) = [(2014,10,1), (2014,10,2), (10,1,1)];

val dimst7 = dates_in_months([(2014,10,1), (2014,10,2),(2014,3,1),(10,3,1),(10,1,1)], [14,1]) = [(10,1,1)];
val dimst8 = dates_in_months([(2014,10,1), (2014,10,2),(2014,3,1),(10,3,1),(10,1,1)], [10,3]) = [(2014,10,1), (2014,10,2),(2014,3,1),(10,3,1)];

(* get_nth *)
val nth1 = get_nth(["a", "b", "c"], 1) = "a";
val nth2 = get_nth(["a", "b", "c"], 2) = "b";
val nth3 = get_nth(["a", "b", "c"], 3) = "c";

(* date_to_string *) 
val dts1 = date_to_string((2014,1,24)) = "January 24, 2014";
val dts2 = date_to_string((2012,2,2)) = "February 2, 2012";
val dts3 = date_to_string((2014,3,24)) =  "March 24, 2014" ;
val dts4 = date_to_string((2012,4,29)) = "April 29, 2012";
val dts5 = date_to_string((2014,5,24)) =  "May 24, 2014" ;
val dts6 = date_to_string((2012,6,29)) =  "June 29, 2012" ;
val dts7 = date_to_string((2014,7,24)) = "July 24, 2014";
val dts8 = date_to_string((2012,8,29)) = "August 29, 2012";
val dts9 = date_to_string((2014,9,24)) = "September 24, 2014";
val dts10 = date_to_string((2012,10,29)) = "October 29, 2012";
val dts11 = date_to_string((2014,11,24)) = "November 24, 2014";
val dts12 = date_to_string((2012,12,29)) = "December 29, 2012";

(* number_before_reaching_sum tests *)
val nbr1 = number_before_reaching_sum(1, [0,0,3,1])= 2;
val nbr2 = number_before_reaching_sum(1, [1,0,3,1])= 0;
val nbr3 = number_before_reaching_sum(5, [1,0,3,1])= 3;

(* what_month *)
val wm1 = what_month(365) = 12;
val wm2 = what_month(1) = 1;
val wm3 = what_month(31) = 1;
val wm4 = what_month(59) = 2;
val wm5 = what_month(60) = 3;
val wm6 = what_month(121) = 5;

(* month_range *)
val mr = month_range(58,62) = [2,2,3,3,3];

(* oldest *)
val oet1 = oldest([(2000,16,4),(2000,16,4)]) = SOME (2000,16,4);
val oet2 = oldest([(2014,10,1), (2014,10,2),(2014,3,1),(10,3,1),(10,1,1)]) = SOME (10,1,1);
val oet3 = oldest([(2014,10,1), (2014,10,2),(2014,3,1),(10,3,1),(10,3,1),(10,10,1)]) = SOME (10,3,1);
val oet4 = oldest([(1,10,1), (2014,10,2),(2014,3,1),(10,3,1),(10,3,1),(10,10,1)]) = SOME (1,10,1);
val oet5 = oldest([(2014,10,1), (2014,10,2),(2014,3,1),(2000,3,1),(10,3,1),(10,10,1)]) = SOME (10,3,1);


(* number in months challenge *)
val nimcst1 = number_in_months_challenge([(2014,10,1), (2014,10,2), (2014,3,1),(10,3,1),(10,1,1)], [10,4,10]) = 2;
val nimcst2 = number_in_months_challenge([(2014,10,1), (2014,10,2),(2014,3,1),(10,3,1),(10,1,1)], [1,3,3,5,10]) = 5;

val nimcst3 = number_in_months_challenge([(2014,10,1), (2014,10,2),(2014,3,1),(10,3,1),(10,1,1)], [14,14,1,3,23,1]) = 3;
val nimcst4 = number_in_months_challenge([(2014,10,1), (2014,10,2),(2014,3,1),(10,3,1),(10,1,1)], [12,24,2,12]) = 0;

val nimcst5 = number_in_months_challenge([(2014,10,1), (2014,10,2),(2014,3,1),(10,3,1),(10,1,1)], [9,3,9,2,6]) = 2;

(* dates_in_months challenge tests *)
val dimcst1 = dates_in_months_challenge([(2014,10,1), (2014,10,2),(2014,3,1),(10,3,1),(10,1,1)], [10,4,10]) = [(2014,10,1),(2014,10,2)];
val dimcst2 = dates_in_months_challenge([(2014,10,1), (2014,10,2),(2014,3,1),(10,3,1),(10,1,1), (2014,10,1)], [1,3,5,5,10]) = [(10,1,1),(2014,3,1),(10,3,1),(2014,10,1),(2014,10,2),(2014,10,1)];

val dimcst3 = dates_in_months_challenge([(2014,10,1), (2014,10,2),(2014,3,1),(10,3,1),(10,1,1)], [14,1,3,1,14,23]) = [(2014,3,1),(10,3,1),(10,1,1)];
val dimcst4 = dates_in_months_challenge([(2014,10,1), (2014,10,2),(2014,3,1),(10,3,1),(10,1,1)], [12,24,2,12]) = [];

val dimcst5 = dates_in_months_challenge([(2014,10,1), (2014,10,2),(2014,3,1),(10,3,1),(10,1,1)], [9,3,2,6,9]) = [(2014,3,1),(10,3,1)];

(* reasonable date tests *)
(* leap year tests *)
val rd1 = reasonable_date((2000,2,29)) = true;
val rd2 = reasonable_date((1900,2,29)) = false;
val rd3a = reasonable_date((1896,2,29)) = true;

(* year tests *)
val rd3b = reasonable_date((0,1,5)) = false;
val rd4 = reasonable_date((2014,0,3)) = false;
val rd5 = reasonable_date((2014,13,1)) = false;

(* month/day tess *)
val rd6 = reasonable_date((2014,1,32)) = false;
val rd7 = reasonable_date((2014,2,29)) = false;
val rd8 = reasonable_date((2014,3,132)) = false;
val rd6 = reasonable_date((2014,3,32)) = false;
val rd7 = reasonable_date((2014,4,31)) = false;
val rd8 = reasonable_date((2014,5,32)) = false;
val rd6 = reasonable_date((2014,6,31)) = false;
val rd7 = reasonable_date((2014,7,32)) = false;
val rd8 = reasonable_date((2014,8,32)) = false;
val rd9 = reasonable_date((2014,9,31)) = false;
val rd10 = reasonable_date((2014,10,32)) = false;
val rd11 = reasonable_date((2014,11,31)) = false;
val rd12 = reasonable_date((2014,12,32)) = false;
val rd13 = reasonable_date((2014,1,0)) = false;
val rd14 = reasonable_date((2014,2,0)) = false;
val rd15 = reasonable_date((2014,3,0)) = false;
val rd16 = reasonable_date((2014,3,0)) = false;
val rd17 = reasonable_date((2014,4,0)) = false;
val rd18 = reasonable_date((2014,5,0)) = false;
val rd19 = reasonable_date((2014,6,0)) = false;
val rd20 = reasonable_date((2014,7,0)) = false;
val rd21 = reasonable_date((2014,8,0)) = false;
val rd22 = reasonable_date((2014,9,0)) = false;
val rd23 = reasonable_date((2014,10,0)) = false;
val rd24 = reasonable_date((2014,11,0)) = false;
val rd25 = reasonable_date((2014,12,0)) = false;


