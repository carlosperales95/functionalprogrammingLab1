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
fun product 1 = 1
  | product n = n * product (n - 1);
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
(* OKay, we have to do a function that returns the 
smallest positive number divisible wthout remainder 
from numbers 1 to n
We can use other auxiliary functions if we want
We have to decide how to handle the case when the parameter n is <1
(I guess if it is negative number we could use absolutes
*)
(*I think my parts are okay but if you can check them a little bit. 
And most importantly we have to be sure we don't 
make a mess with the comments and everything works*)
