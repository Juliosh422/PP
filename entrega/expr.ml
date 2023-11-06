();;
(*- : unit = ()*)
2 + 5 * 3;;
(*- : int = 17*)
1.25 *. 2.0;;
(*- : float = 2.5*)
(* 2 - 2.0;; *)
(*Error de tipos, se esperaba un int y recibe un float*)
(* 3.0 + 2.0:: *)
(*Error de tipos, se esperaban dos int pero recibe dos float*)
5 / 3;;
(*- : int = 1*)
5 mod 3;;
(*- : int = 2*)
2.0 *. 3.0 ** 2.0;;
(*- : int = 512 | MAL*)
(*- : int = 18 | Por no respetar el orden de operaciones*)
2.0 ** 3.0 ** 2.0;;
(*- : int = 64 | MAL*)
(*- : int = 512 | Porque el orden de operacion de ** es de izq. a der.*)
sqrt;;
(*- : int -> float = <fun>*)
(* sqrt 4;; *)
(*Error de tipos, esperaba un float y recibe un int*)
int_of_float;;
(*- : float -> int = <fun>*)
float_of_int;;
(*- : int -> float = <fun>*)
3.0 = float_of_int 3;;
(*- : bool = true*)
(* int_of_float -2.9;; *)
(*Error de tipos, recibe un int pero esperaba un float*)
int_of_float 2.1 + int_of_float (-2.9);;
(*- : int = 0*)
truncate;;
(*- : float -> int = <fun>*)
truncate 2.1 + truncate (-2.9);;
(*- : int = 0*)
floor;;
(*- : float -> int = <fun> | MAL*)
(*- : float -> float = <fun>*)
(* floor (2.1) + floor (-2.9);; *)
(*- : int = -1 | MAL*)
(*Error de tipos, recibe dos float pero necesita dos int*)
ceil;;
(*- : float -> int = <fun>*)
ceil 2.1 +. ceil (-2.9);;
(*- : int = 1*)
int_of_char;;
(*- : char -> int = <fun>*)
int_of_char 'A';;
(*- : int = 65*)
char_of_int;;
(*- : int -> char = <fun>*)
char_of_int 66;;
(*- : char = 'B'*)
Char.code;;
(*- : char -> int = <fun>*)
Char.code 'B';;
(*- : int = 66*)
Char.chr;;
(*- : int -> char = <fun>*)
Char.chr 67;;
(*- : char = 'C'*)
'\067';;
(*- : char = 'C'*)
Char.chr (Char.code 'a' - Char.code 'A' + Char.code 'M');;
(*- : char = 'm'*)
Char.lowercase_ascii;;
(*- : char -> char = <fun>*)
Char.lowercase_ascii 'M';;
(*- : char = 'm'*)
Char.uppercase_ascii;;
(*- : char -> char = <fun>*)
Char.uppercase_ascii 'm';;
(*- : char 'M'*)
"this is a string";;
(*- : string = "This is a string"*)
String.length;;
(*- : string -> int = <fun>*)
String.length "longitud";;
(*- : int = 8*)
(* "1999" + "1";; *)
(*Error de tipos, esperaba dos int y recibe dos string*)
"1999" ^ "1";;
(*- : string = "19991"*)
int_of_string;;
(*- : string -> int = <fun>*)
int_of_string "1999" + 1;;
(*- : int = 2000*)
(* \065\066;; *)
(*- : string = "AB" | MAL*)
(*Error de caracter ilegal, no se admite (\\)*)
string_of_int;;
(*- : int -> string = <fun>*)
string_of_int 010;;
(*- : string = "010"*)
true && false;;
(*- : bool = false*)
true || false;;
(*- : bool = true*)
(1 < 2) = false;;
(*- : bool = false*)
"1" < "2";;
(*Error de tipos | MAL*)
(*- : bool = true | Porque el valor por orden alfabético de "1" es menor al de "2"*)
2 < 12;;
(*- : bool = true*)
"2" < "12";;
(*Error de tipos | MAL*)
(*- : bool = false | Porque por orden alfabético, '2' es mayor que '1'*)
"uno" < "dos";;
(*Error de tipos | MAL*)
(*- : bool= false | Porque por orden alfabético 'u' va después de 'd'*)
if 3 = 4 then 0 else 4;;
(*- : int = 4*)
if 3 = 4 then "0" else "4";;
(*- : string = "4"*)
(* if 3 = 4 then 0 else "4";; *)
(*Error de tipos, se esperaba un int y recibe un string*)
(if 3 < 5 then 8 else 10) + 4;;
(*- : int = 12*)