(* Homework2 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

val aeot1 = all_except_option("string", ["string"]) = SOME [];
val aeot2 = all_except_option("string", ["string","string1"]) = SOME ["string1"];
val aeot3 = all_except_option("string", ["string1","string"]) = SOME ["string1"];
val aeot4 = all_except_option("string", []) = NONE;
val aeot5 = all_except_option("string", ["string1"]) = NONE;
val aeot6 = all_except_option("string", ["string1","string2"]) = NONE;

val gs11 = get_substitutions1([["foo"],["there"]], "foo") = [];
val gs12 = get_substitutions1([["foo","here"],["there"]], "foo") = ["here"]
val gs13 = get_substitutions1([["foo","here"],["there","everywhere","foo"]], "foo") = ["here","there","everywhere"];
val gs14 = get_substitutions1([["not here"],["there","foo","everywhere"]], "foo") = ["there","everywhere"]
val gs15 = get_substitutions1([["not here"],["nor here"]], "foo") = [];
val gs16 = get_substitutions1([["foo","here"],["here", "there","everywhere","foo"]], "foo") = ["here","here","there","everywhere"];

val gs21 = get_substitutions2([["foo"],["there"]], "foo") = [];
val gs22 = get_substitutions2([["foo","here"],["there"]], "foo") = ["here"]
val gs23 = get_substitutions2([["foo","here"],["there","everywhere","foo"]], "foo") = ["here","there","everywhere"];
val gs24 = get_substitutions2([["not here"],["there","foo","everywhere"]], "foo") = ["there","everywhere"];
val gs25 = get_substitutions2([["not here"],["nor here"]], "foo") = [];
val gs26 = get_substitutions2([["foo","here"],["here", "there","everywhere","foo"]], "foo") = ["here","here","there","everywhere"];



val simt1 = similar_names([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], {first="Fred", middle="W", last="Smith"}) =
	    [{first="Fred", last="Smith", middle="W"}, {first="Fredrick", last="Smith", middle="W"},
	     {first="Freddie", last="Smith", middle="W"}, {first="F", last="Smith", middle="W"}];
val simt2 = similar_names([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], {first="Derf", middle="W", last="Smith"}) =
	    [{first="Derf", middle="W", last="Smith"}];


val cc1 = card_color((Clubs, Num 2)) = Black;
val cc2 = card_color((Spades, Num 3)) = Black;
val cc3 = card_color((Diamonds, Num 9)) = Red;
val cc4 = card_color((Hearts, Num 6)) = Red;
val cc5 = card_color((Clubs, Ace)) = Black;
val cc6 = card_color((Clubs, Jack)) = Black;
val cc7 = card_color((Spades, Ace)) = Black;
val cc8 = card_color((Spades, Queen)) = Black;
val cc9 = card_color((Hearts, Num 99)) = Red;
val cc10 = card_color((Diamonds, Num 101)) = Red;


val cv1 = card_value((Clubs, Num 2)) = 2;
val cv2 = card_value((Clubs, Num 10)) = 10;
val cv3 = card_value((Clubs, Ace)) = 11;
val cv4 = card_value((Clubs, King)) = 10;
val cv5 = card_value((Clubs, Queen)) = 10;
val cv6 = card_value((Clubs, Jack)) = 10;


val rc1 = ((remove_card([(Hearts, Ace)], (Hearts, Jack), IllegalMove); false) handle IllegalMove=> true);
val rc2 = remove_card([(Hearts, Ace)], (Hearts, Ace), IllegalMove) = [];
val rc3 = remove_card([(Hearts, Ace),(Hearts,Jack)], (Hearts, Ace), IllegalMove) = [(Hearts,Jack)];
val rc4 = remove_card([(Hearts, Ace),(Spades,Ace)], (Hearts, Ace), IllegalMove) = [(Spades,Ace)];

val asc1 = all_same_color([(Hearts, Ace), (Hearts, Ace), (Hearts, Jack), (Hearts, Num 5)]) = true;
val asc2 = all_same_color([(Hearts, Ace), (Diamonds, Ace), (Hearts, Jack), (Diamonds, Num 5)]) = true;
val asc3 = all_same_color([(Hearts, Ace), (Spades, Ace), (Hearts, Jack), (Diamonds, Num 5)]) = false;
val asc4 = all_same_color([(Hearts, Ace), (Diamonds, Ace), (Hearts, Jack), (Clubs, Num 5)]) = false;
val asc5 = all_same_color([(Clubs, Ace), (Clubs, Ace), (Clubs, Jack), (Clubs, Num 5)]) = true;
val asc6 = all_same_color([(Spades, Ace), (Clubs, Ace), (Clubs, Jack), (Spades, Num 5)]) = true;
val asc7 = all_same_color([(Hearts, Ace), (Spades, Ace), (Hearts, Jack), (Diamonds, Num 5)]) = false;
val asc8 = all_same_color([(Hearts, Ace), (Diamonds, Ace), (Hearts, Jack), (Spades, Num 5)]) = false;

val sc1 = sum_cards([(Clubs, Num 2),(Diamonds, Num 2)]) = 4;
val sc2 = sum_cards([(Clubs, Num 2),(Hearts, Num 6)]) = 8;
val sc3 = sum_cards([(Clubs, Num 2),(Diamonds, Jack)]) = 12;
val sc4 = sum_cards([(Clubs, Num 2),(Clubs, Ace)]) = 13;
val sc5 = sum_cards([(Clubs, Num 2),(Clubs, Queen)]) = 12;
val sc6 = sum_cards([(Clubs, Num 2),(Clubs, King)]) = 12;
val sc7 = sum_cards([(Diamonds, Num 2),(Clubs, Ace),(Hearts, Num 8),(Clubs, Ace)]) = 32;
val sc8 = sum_cards([(Clubs, Num 5),(Clubs, Queen)]) = 15;
val sc9 = sum_cards([(Clubs, Num 2),(Clubs, King)]) = 12;

val score1 = score([(Clubs, Num 2),(Diamonds, Num 2)],5) = 1;
val score2 = score([(Clubs, Num 2),(Hearts, Num 6)],3) = 15;
val score3 = score([(Clubs, Num 2),(Diamonds, Jack)],7) = 15;
val score4 = score([(Clubs, Num 2),(Clubs, Ace)],7) = 9;

val test11 = officiate([(Hearts, Num 2),(Clubs, Num 4)],[Draw], 15) = 6;

val test12 = officiate([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],
                       [Draw,Draw,Draw,Draw,Draw],
                       42)
             = 3;

val test13 = ((officiate([(Clubs,Jack),(Spades,Num(8))],
                         [Draw,Discard(Hearts,Jack)],
                         42);
               false) 
              handle IllegalMove => true);
             
             
