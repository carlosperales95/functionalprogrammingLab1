fun append xs ys = foldr op:: ys xs;
fun member x xs = foldl (fn(y,l) => l orelse x=y) false xs;
fun last xs = foldl (fn(x,y) => x) 0 xs;
fun reverse xs = foldl op:: [] xs;
fun filter f xs = foldr (fn(y,l) => if f y then y::l else l) [] xs;

append [1,2,3] [4,5];
reverse [1,2,3];
member 2 [1,2,3];
filter (fn n => n > 50) [1,2,3,4,200,100,5];
last [1,2,3,4,200,100,5,6];
