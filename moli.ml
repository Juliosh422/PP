let doble = function x-> 2*x;;

let double x=2*x;; (*Abreviatura de lo de arriba*)

let alltrue _ = true;; (*polimorfismo*)
(*val alltrue : 'a -> bool = <fun>*)

let id x = x;;

id abs (-7);; (*= 7*)
(*== (id abs) (-7) pq id devuelve la funcion abs que se aplica a -7*)

let abs x = if x<0 then -x else x
(*if <b> then <e1> else <e2> : cualquier tipo*)

let s = function x -> function y -> x + y;;
let s x y = x+y;;
(*lo mismo*)

if <b1> then <b2> else false;;
<b1> && <b2>;;
(*Son idénticas*)

(*///////////////////////*)

let rec length l = 
  if l =[] then 0
  else 1 + length (List.tl l);;

let length ll =
  let rec aux (l,i)=
    if l= [] then i
    else aux (List.tl l, i+1)
  in aux (ll,0);;

let rec last l = 
  if List.tl l= [] then List.hd 
  else last (List.tl l);;
  (*O(n)*)

let rec last l =
  if length l = 1 then List.hd l
  else last (List.tl l);;
  (*O(n²)*)


let hd = function (h::_) -> h;;

let hd (h::_) = h;;


(*Con constructores*)
let rec length = function
  [] -> 0 |
  _::t -> 1 + length t;;

let rec last = function
  h::[] -> h |
  _::t -> last t;;

(*Comparador de funciones*)

let rec compFun a b x y =
  if (x>=y) then (a x = b x)
  else (a x = b x) && compFun a b (x+1) y;;


let last (h::t) =
  List.fold_left (fun _ x -> x) h y;;

(*1/XII/23*)

let <p> = <e1>
______________
let <p1> = <e1>
and <p2> = <e2>
.
.
.
and <pn> = <en>

(*Lo mismo que: Usando tuplas*)

let <p1>, <p2>, ..., <pn> = <e1>, <e2>, ..., <en>

(*DOS CASOS*)

let x = 1 and y = 2;;
let x = x + y;; (*x = 3*)
let y = x * y;; (*y = 6*)

(*No es lo mismo que:*)

let x = 1 and y = 2;;
let x = x + y;; (*x = 3*)
and y = x * y;; (*y = 2*) (*Se evalúan expresiones antes de asignar*)
 
(*Caso práctico: Definición múltiple*)

let rec par n = (* n >= 0 *)
  n = 0 || impar (n-1)
and impar n = (* n >= 0 *)
  n <> 0 && par (n-1);;

(*Lo mismo que: Usando tuplas*)

let rec (par, impar) = 
  (function n -> n = 0 || impar (n-1)),
  (function n -> n <> 0 && par (n-1));;
(*Por alguna razón no compila, pero a priori está bien*)

(** Definición de datos estructurados **)

type persona = {name: string; age: int}

{name = "Pepe"; age = 29};;
- : person = {name = "Pepe"; age = 29}

(** Creacion de modulos **)

module Contador : sig
	val next : unit -> int
	val reset : unit -> int
end = struct
	let n = ref 0
	let next () =
		n := !n +1;
		!n
	let reset () =
		n := 0
end
