(* Coursera Programming Languages, Homework 3, Provided Code *)

exception NoAnswer

datatype pattern = Wildcard
		 | Variable of string
		 | UnitP
		 | ConstP of int
		 | TupleP of pattern list
		 | ConstructorP of string * pattern

datatype valu = Const of int
	      | Unit
	      | Tuple of valu list
	      | Constructor of string * valu

fun g f1 f2 p =
    let 
	val r = g f1 f2 
    in
	case p of
	    Wildcard          => f1 ()
	  | Variable x        => f2 x
	  | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
	  | ConstructorP(_,p) => r p
	  | _                 => 0
    end

(**** for the challenge problem only ****)

datatype typ = Anything
	     | UnitT
	     | IntT
	     | TupleT of typ list
	     | Datatype of string

(**** you can put all your code here ****)
fun only_capitals s =
    List.filter (fn x => (Char.isUpper o String.sub) (x,0)) s

fun longest_string1 s = 
    List.foldl (fn (x,y) => if String.size(x) > String.size(y) then x else y) "" s

fun longest_string2 s = 
    List.foldl (fn (x,y) => if String.size(x) >= String.size(y) then x else y) "" s

fun longest_string_helper f s =
    List.foldl (fn (x,y) => if f(String.size(x),String.size(y)) then x else y) "" s
    
val longest_string3 = longest_string_helper (fn (x,y) => x > y )

val longest_string4 = longest_string_helper (fn (x,y) => x >= y)
    
val longest_capitalized_string = longest_string1 o only_capitals

fun rev_string s = 
    (implode o rev o explode) s

fun first_answer f lst =
    case lst of
	[] => raise NoAnswer
      | x::xs' => case f x of
		     SOME y => y
		   | NONE => first_answer f xs'

fun all_answers f lst = 
    let 
	val nf = fn (x,y) => (case y of NONE => NONE 
				      | SOME y => SOME (x@y) )
    in
    List.foldl (nf) (SOME ([])) (List.map f lst)

    end
					   
