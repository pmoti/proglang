(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)
fun all_except_option(target, srchlist) =
    case srchlist of 
	[] => NONE 
      | x::xs' => if (same_string(x, target))
		  then SOME xs'
		  else
		      case all_except_option(target,xs') of
			  SOME y => SOME (x::y)
			| NONE => NONE

fun get_substitutions1(search_space, s1) = 
    case search_space of
	[] => []
     |  x::xs' => 
	(case all_except_option(s1,x) of
	     NONE => get_substitutions1(xs', s1)
	   | SOME y => y @ get_substitutions1(xs', s1))

fun get_substitutions2(search_space, s1) = 
    let
	fun get_sub1 (search_spc, accum) =
	    case search_spc of
		[] => accum
	      | x::xs' => get_sub1(xs', accum @ 
					(case all_except_option(s1,x) of
					     NONE => []
					   | SOME y => y))
    in
	get_sub1(search_space, [])
    end

fun similar_names(sim_names_dict, full_name) =
    let
	val {first=x,middle=y,last=z} = full_name
	val sim_names = get_substitutions2(sim_names_dict, x)
	fun get_name_list (names) =
	    case names of
		[] => []
	      | a::as' => ({first=a, middle=y, last=z})::get_name_list(as')
    in
	full_name::get_name_list(sim_names)
    end
    
(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)
fun card_color(player_card) =
    case player_card of
	(Clubs,_) => Black
      | (Spades,_) => Black
      | _ => Red

fun card_value(player_card) = 
    case player_card of
	(_,Ace)=>11
      | (_,Num x) => x
      | _ =>  10

fun remove_card(cards, card, ex) = 
    case cards of
	[] => raise ex
      | x::xs' => if (x=card) 
		  then xs'
		  else x::remove_card(xs',card,ex)

fun all_same_color(cards) =
    case cards of
	[] => true
      | x1::[]  => true
      | x1::(x2::rest) => (card_color(x1)=card_color(x2)) andalso all_same_color(x2::rest)

fun sum_cards(cards) = 
    let
	fun add(cs, total) =
	    case cs of
		[] => total
	      | x::xs' => add(xs',total+card_value(x))
    in
	add(cards,0)
    end
	
fun score(cards, goal) =
    let 
	val held_total = sum_cards(cards)
	val prelim_score = if (held_total>goal)
			   then 3*(held_total-goal)
			   else goal-held_total
    in
	if (all_same_color(cards)) then prelim_score div 2 else prelim_score
    end
	
(* Used nested function here as we haven't learned how to bind functions w/ and *) 
fun officiate(cards, moves, goal) =
    let 
	fun process_moves(held_cards, cs,  mvs) =
	    let 
		fun draw(held_cards, cs, mvs) =
		    case cs of
			[] => held_cards
		      | x::xs' => if (sum_cards(x::held_cards) > goal)
				  then x::held_cards
				  else process_moves(x::held_cards, xs',mvs)
	    in
		case mvs of
		    [] => held_cards
		  | (Discard x)::xs' => process_moves(remove_card(held_cards, x, IllegalMove), cs, xs')
		  | Draw::xs' => draw(held_cards, cs, xs')			  
	    end
    in
	score(process_moves([],cards,moves),goal)
    end

