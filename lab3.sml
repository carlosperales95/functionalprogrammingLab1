(* ASSIGNMENT 3 *)

(* TASK 1 *)

fun average' a n [] = a/n 
| average' a n (x :: xs) = average' (a+x) (n+1.00) xs;

fun average xs = average' 0.00 0.00 xs;

(* TASK 2 *)

(* average' a n []
TYPE: real -> real -> real list -> real
PRE: a and n should be of type real, the list should be a list of real numbers
POST: a/n, being a the sum of all numbers in the list and n the number of elements in the list
EXAMPLE: average' 0.00 0.00 [1.00, 5.40, 3.10, 6.00] = 3,875
		 average' 0.00 0.00 [~1.00, 0.50, 20.00, ~3.80, 12.04] = 5.548
*)


(* average xs
TYPE: real list -> real
PRE: xs must be a list of real numbers
POST: (sum of elements in the list)/(number of elements in the list)
EXAMPLE: average [1.00, 5.40, 3.10, 6.00] = 3,875
		 average [~1.00, 0.50, 20.00, ~3.80, 12.04] = 5.548
*)


(* TASK 3 *)

(* append: 'a list -> 'a list -> 'a list *)

(* member: ''a -> ''a list -> bool *)

(* last: 'a list -> 'a *)

(* reverse: 'a list -> 'a list *)

(* filter: ('a -> bool) -> 'a list -> 'a list *)


(* TASK 4 *)

datatype tree = Void | Node of tree * int * tree;

fun comparing a b x = if x>=a andalso x<b then true else false; 

 

fun sub_tree a b (Void) = Void
	|sub_tree a b (Node (Void, x , Void)) = if (comparing a b x)
												then
													Node (Void, x, Void)
												else
													Void
	| sub_tree a b (Node (l, x ,r)) = if(comparing a b x)
										then
											Node (sub_tree a b l, x , sub_tree a b r)
										else
											sub_tree a b r
	| sub_tree a b (Node (Void, x ,r)) = if(comparing a b x)
												then
													Node (Void, x , sub_tree a b r)
												else
													sub_tree a b r
	| sub_tree a b (Node (l, x ,Void)) = if(comparing a b x)
												then
													Node (sub_tree a b l, x , Void)
												else
													sub_tree a b l;
