let p = (1 + 1, asin 1.), true;;
(*val p : (int, float),bool = (2, pi/2), true*)
(*val p : (int * float) * bool = ((2, 1.57079632679489656), true)*)

let (x, y), z = p;;
(*val (x, y), z : (int * float) * bool = ((2, 1.57079632679489656), true)*)
(*val x : int = 2
  val y : float = 1.57079632679489656
  val z : bool = true*)

let p1, p2 = p in let p11, _ = p1 in (p2, 2 * p11);;
(*- : bool * int = (true, 4)*)

let f (x, y) = 2 * x + y;;
(*val f ; (int * int) -> int = <fun>*)
(*val f ; int * int -> int = <fun>*)

let f2 x y z = x + 2 * y + 3 * z;;
(*let f2 : int -> int -> int -> int = <fun>*)

let g x y z = x (y, 2);;
(*val g : ('a * 'b -> 'c) -> ('a -> 'b -> 'c) = <fun>*)
(*val g : ('a * int -> 'c) -> ('a -> 'b -> 'c) = <fun>*)

g fst 1 "hola";;
(*- : int = 1*)


g snd fst true;;
(*- : int = 2*)

g f 2 3;;
(*- : int = 6*)

g (function (f, x) -> f (f x)) (function x -> x * x) 3;;
(*- : int = 16*)

let x, y, z = 1, 2, 3;;
(*val x = 1
  val y = 2
  val z = 3*)

f2 x y z;;
(*- : int = 14*)

let x, y, z = y, z, x in f2 x y z;;
(*- : int = 11*)

f2 x y z;;
(*- : int = 14*)

let swap (x,y) = y,x;;
(*val swap : (int * int) -> (int * int) = <fun>*)
(*val swap : a' * b' -> b' * a' = <fun>*)

let p = 1, 2;;
(*val p = int * int = (1, 2)*)

(*f p;*)
(*Da warning porque debe tener tipo unit*)
(*- : int = 4*)

(*let p = swap p in f p;;*)
(*Da warning porque debe tener tipo unit*)
(*- : int = 5*)

f p;
(*- : int = 4*)