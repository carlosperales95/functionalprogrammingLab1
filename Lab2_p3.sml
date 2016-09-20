(* 3 FRUIT *)

(* Part 1*)

datatype fruit = 
	Apple of real
	| Banana of real
	| Lemon of int;

(* Part 2 *)

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
