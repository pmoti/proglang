(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)
fun all_except_option(target : string, srchlist : string list) =
    let 
	fun remove_from_list(t1 : string, srchlist1 : string list) = 
	   case srchlist1 of 
	       [] => []
	     | x::xs' => if (same_string(x, target))
			 then xs'
			 else (x::remove_from_list(target,xs'))
	val res = remove_from_list(target, srchlist);
    in
	case res of
	 [] => NONE
	 | x => SOME x
    end

fun get_substitutions1(search_space : string list list, s1: string) = 
    case search_space of
	 [] => []
       | x::xs' => all_except_option(s1, x)  @ get_substitutions1(xs', s1)
    
(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)
