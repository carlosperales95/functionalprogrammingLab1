(* 4 TREE *)

(* Part 1 *)
			
datatype ''a ltree = Leaf of ''a | Node of ''a * ''a ltree list;			
					
Node ("Tier0", [Node("Tier1", [Node ("Tier2", [Leaf ("Tier3")])])]);
val it = Node ("Tier0", [Node ("Tier1", [Node ("Tier2", [Leaf "Tier3"])])]

(* Part 2 *)
(*FUNCTIONS NOT DONE YET*)
(* 2.a *)

fun count (Leaf _) = 0
	|count (Node (_, (_::xs))) = 1 + count xs;

(* 2.b *)

fun labels (Leaf _) = 0
	|labels (Node (_, (_::xs))) = 1 + count xs;

(* 2.c *)

fun is_present (Leaf _) = 0
	|is_present (Node (_, (_::xs))) = 1 + count xs;

(* 2.d *)

fun height (Leaf _) = 0
	| height (Node ( _, (_::xs))) = 1 + height xs;
