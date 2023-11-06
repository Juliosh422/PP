let p = function x -> let pi = (2.0*.asin(1.)) in (2. *. x) *. pi;;

let area = function x -> let pi=2.*.asin(1.) in pi*.x**2.;;

let absf (x: float) : float = if x>=0. then x else (-1.)*.(x);;

absf (-2.5);;

let even = function x -> (x mod 2 = 0);;

let next3 x = if x mod 3 = 0 then x else
  x-(x mod 3)+3;;

let is_a_letter x = x>='a'&&x<='z';;

let string_of_bool x = if x then "verdadero" else "falso";;