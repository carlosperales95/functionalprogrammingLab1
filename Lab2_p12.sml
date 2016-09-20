(*Q 1*)

(* upto (m,n)
   TYPE: int * int -> int list
   PRE:  n > m are integers
   POST: list of integers from m to n
   EXAMPLES: upto(~2,3) = [~2, ~1, 0, 1, 2, 3]
*)
(* VARIANT: m*)	
fun upto (m,n) =
	if m > n then
		[]
	else
		m :: upto(m+1,n);
		
(* iota n
   TYPE: int -> int list
   PRE:  n is an integer
   POST: list of integers from 0 to n
   EXAMPLES: iota 3 = [0, 1, 2, 3]
*)
fun iota n =
	upto(0,n);

(*Q 2.1*)

(* member(x,xs)
   TYPE: ''a * ''a list -> bool
   PRE:  
   POST: true if x is in the list
   EXAMPLES: member(2,[4,5,6,2]) = true
*)
(* VARIANT: length of xs*)	
fun member (x, []) = false
  | member (x, y::ys) =
		x = y orelse member(x, ys);

(* inter xs ys
   TYPE: ''a list -> ''a list -> ''a list
   PRE: two lists 
   POST: intersection of both lists
   EXAMPLES: inter [2,3,4] [2,3] = [2,3]
*)
(* VARIANT: length of xs*)	
fun inter [] ys = []
	| inter (x::xs) ys = 
		if member(x,ys) then
			x::(inter xs ys)
		else 
			inter xs ys;

(*Q 2.2*)
			
(* inter' xs ys
   TYPE: int list -> int list -> int list
   PRE: two ascending sorted lists of integers 
   POST: intersection of both lists
   EXAMPLES: inter' [2,3,4] [2,3] = [2,3]
*)
(* VARIANT: length of xs, length of ys*)				
fun inter' [] ys = []
  | inter' xs [] = []
  | inter' (x::xs) (y::ys) =
      if x = y then
				x::(inter' xs ys)
      else
				if x > y then
					inter' (x::xs) ys
				else
					inter' xs (y::ys);
					

(*Q 2.3
inter: 10.383
inter'  0.053
*)
