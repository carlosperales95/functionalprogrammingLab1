(*Functional Programming 1 - Assignment 1
Authors: Daniel; Carlos; (Group 18)
*)

(* Q 1.1
product 3
→ if 3 = 1 then 1 else 3 * product (3 - 1)
→ if false then 1 else 3 * product (3 - 1)
→ 3 * product (3 - 1)
→ 3 * product 2
→ 3 * (if 2 = 1 then 1 else 2 * product (2 - 1))
→ 3 * (if false then 1 else 2 * product (2 - 1))
→ 3 * (2 * product (2 - 1))
→ 3 * (2 * product 1)
→ 3 * (2 * (if 1 = 1 then 1 else 1 * product (1 - 1)))
→ 3 * (2 * (if true then 1 else 1 * product (1 - 1)))
→ 3 * (2 * 1)
→ 3 * 2
→ 6
*)

(* Q 1.2
The function computes n!/0!
*)

(* product n
   TYPE: int -> int
   PRE:  n ≥ 1
   POST: n!/0! (i.e., the "factorial" of n)
   EXAMPLES: product 1 = 1
             product 5 = 120
*)
(* VARIANT: n *)
fun product n =
	if n = 1 then
		1
	else
		n * product (n - 1);
		
(* Q 2.1
fun plus x y = x + y;
plus 4 5;
*)
val plus = fn x => fn y => x + y;

(* Q 2.2
val foo = plus 4 5;
The result given by the composition is the sum 4 + 5.
*)

(* Q 2.3
val bar = plus 4;
Only the first step of the composition is performed and it returns
a relation from int to int, so no integer value is returned.
*)

(* Q 2.4
plus 3 4
→ fn x => fn y => 3 + 4;
→ 3 + 4
→ 7
*)

(* Q 3.1 *)
(* fun1 n
   TYPE: int -> int
   PRE:  n is an integer
   POST: n + 13
   EXAMPLES: fun1 1 = 14
             fun1 29 = 42
*)
fun fun1 n = n + 13;

(* Q 3.2 *)
(* fun2 x y
   TYPE: int -> int -> int
   PRE:  x,y are integers
   POST: x - y
   EXAMPLES: fun2 1 2 = ~1
             fun2 2 1 = 1
*)
fun fun2 x y = x - y;

(* Q 3.3 *)
(* fun3 n
   TYPE: int -> int * int
   PRE:  n is an integer
   POST: ( n , n + 1 )
   EXAMPLES: fun3 2 = (2,3)
             fun3 4 = (4,5)
*)
fun fun3 n = ( n , n + 1 );

(* Q 3.4 *)
(* fun4 n
   TYPE: int * int -> int
   PRE:  x and y are integers
   POST: x + y
   EXAMPLES: fun4 (2,6) = 8
             fun4 (10,1) = 11
*)
fun fun4 (x,y) = x + y ;

(* Q 3.5 *)
(* fun5 n
   TYPE: int -> real -> string -> string
   PRE: x is an integer, y is a double and z is a string
   POST: if(x<>0 && y>1.00) z^"goodconditions" else z^"badconditions"
   EXAMPLES: fun5 1 2.00 "first" = "firstgoodconditions"
             fun5 5 1.00 "second"= "secondbadconditions"
*)
fun fun5 x y z = if x<>0 andalso y>1.00 then z ^ "goodconditions" else z ^ "badconditions";

(* Q 3.6 *)
(* fun6 n
   TYPE: int * (string * string * int) -> int * string
   PRE: x and w are integers, y and z are strings 
   POST: x + w and y ^ z
   EXAMPLES: fun6 (1,("hello", "world", 4) ) = (5,"helloworld")
             fun6 (3,("world", "bye", 12) ) = (15,"worldbye")
*)
fun fun6 (x , (y, z, w) ) = (x + w , y ^ z);

(* Q 4 *)
fun abs n = 
	if n >= 0 then
		n
	else
		~n;

(* gcd(m,n)
   TYPE: int * int -> int
   PRE:  m and n are integers
   POST: greatest common divisor of m and n
   EXAMPLES: gcd(6,8) = 2
             gcd(~7,13) = 1
*)
(* VARIANT: m,n *)
fun gcd(m,n) =
	if m = 0 then
		abs(n)
	else
		gcd(n mod abs(m),m);

(* lcm_pair(m,n)
   TYPE: int * int -> int
   PRE:  m and n are integers
   POST: least positive integer divisible by both m and n
   EXAMPLES: lcm_pair(6,8) = 24
             lcm_pair(~7,13) = 91
*)		
fun lcm_pair(m,n) =
	if m * n = 0 then
		0
	else
		abs(m * n) div gcd(m,n);

(* lcm(n)
   TYPE: int -> int
   PRE:  n is an integer
   POST: smallest positive number that is evenly divisible by all 
				 numbers from 1 to |n|
   EXAMPLES: lcm(7) = 420
             lcm(13) = 360360
*)
(* VARIANT: n*)	
fun lcm n =
	if n = 0 then
		0
	else 
		if abs(n) = 1 then
			1
		else
			lcm_pair(lcm(abs(n) - 1),n);
