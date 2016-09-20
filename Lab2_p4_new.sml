(* 4 TREE *)

(* Part 1 *)
			
datatype 'a ltree = Node of 'a * 'a ltree list;			
					
val it = Node(1, [
		Node(2,nil),
		Node(3, [
				Node(4,nil),
				Node(5, [
						Node(7,nil)
				]),
		Node(6,nil)
])
]);

(* Part 2 *)
(*FUNCTIONS NOT DONE YET*)
(* 2.a *)

fun count(Node(a,nil)) = 1
	| count(Node(a,t::ts)) =
		count(t) + count(Node(a,ts));
		
count(it);
