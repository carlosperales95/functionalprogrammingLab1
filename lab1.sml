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
(* VARIANT: n 
fun product 1 = 1
  | product n = n * product (n - 1);
fun product n =
	if n = 1 then
		1
	else
		n * product (n - 1);
*)		

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

(* Q 3.1*)
(* fun1 n
   TYPE: int -> int
   PRE:  n is an integer
   POST: n + 13
   EXAMPLES: fun1 1 = 14
             fun1 29 = 42
*)
fun1 n = n + 13;

(* Q 3.2*)
(* fun2 x y
   TYPE: int -> int -> int
   PRE:  x,y are integers
   POST: x - y
   EXAMPLES: fun2 1 2 = ~1
             fun2 2 1 = 1
*)
val fun2 = fn x => fn y => x - y;

(* Q 3.3*)
(* fun3 n
   TYPE: int -> int * int
   PRE:  n is an integer
   POST: 
   EXAMPLES: fun2 1 2 = ~1
             fun2 2 1 = 1
*)
val fun2 = fn x => fn y => x - y;
