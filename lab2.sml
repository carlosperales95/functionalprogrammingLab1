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
	upto(0,n-1);

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

(*Q 3.1*)

datatype fruit = 
	Apple of real
	| Banana of real
	| Lemon of int;

(*Q 3.2*)

(* sumPrice [] pa pb pl

   TYPE: list -> real -> real -> real -> real
   
   PRE:  Elements in the list should be of type fruit (Apple, Banana Lemon)
		 pa, pb and pl are the prices for each of these fruits and they must be real type.
   
   POST: Price of all the fruits in the list (Weight/number * product's price)
   
   EXAMPLES: sumPrice [Apple 2.12, Banana 4.00, Lemon 2] 0.80 1.03 0.40 = 5.978
			       sumPrice [Banana 1.20, Lemon 6, Lemon 2, Apple 0.39, Banana 0.36] 0.80 1.03 0.40 = 5.1188
             sumPrice [Apple 0.34, Lemon 7] 2.08 1.83 0.90 = 7.0072
*)

fun sumPrice [] pa pb pl = 0.00 
	| sumPrice (x::xs) pa pb pl = 
		let   
			fun pricing (Apple a) = a * pa
			| pricing (Banana b) = b * pb
			| pricing (Lemon l) = real l * pl     
		in
			pricing x + sumPrice xs pa pb pl
		end;
		
(*Q 4.1*)
			
datatype 'a ltree = Node of 'a * 'a ltree list;	

(*Q 4.2*)

(* count t
   TYPE: 'a ltree -> int
   PRE: t is an ltree 
   POST: number of nodes of the tree
   EXAMPLES: count (Node (1, [Node (2, [])])) = 2;
*)
(* VARIANT: number of subtrees of t*)	
fun count (Node(a,[])) = 1
	| count (Node(a,t::ts)) =
		count t + count (Node(a,ts));

(* labels t
   TYPE: 'a ltree -> 'a list
   PRE: t is an ltree 
   POST: list of labels of the tree nodes
   EXAMPLES: labels (Node (1, [Node (2, [])])) = [2, 1];
*)
(* VARIANT: number of subtrees of t*)	
fun labels (Node(a,[])) = [a]
	| labels (Node(a,t::ts)) =
		labels t @ labels(Node(a,ts));

(* is_present t x
   TYPE: ''a ltree -> ''a -> bool
   PRE: t is an ltree, x a putative label
   POST: true if x is a label in ltree
   EXAMPLES: is_present (Node (1, [Node (2, [])])) 2 = true;
*)
(* VARIANT: number of subtrees of t*)		
fun is_present (Node(a,[])) x = (a = x)
	| is_present (Node(a,t::ts)) x =
		(is_present t x) orelse (is_present (Node(a,ts)) x);

(* height t
   TYPE: 'a ltree -> int
   PRE: t is an ltree 
   POST: height of the tree
   EXAMPLES: height (Node (1, [Node (2, [])])) = 2;
*)
(* VARIANT: number of subtrees of t*)	
fun height (Node(a,[])) = 1
	| height (Node(a,t::ts)) =
		Int.max(height t + 1, height (Node(a,ts)));
