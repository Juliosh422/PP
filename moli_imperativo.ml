(*OCaml imperativo:*)

(*Cargar un módulo*)
#load "mi_modulo.cmo"
mi_modulo.funcion;;
(*- : _ -> _ = <fun>*)

(*Si no se especifica el módulo de la funcion:*)
funcion;;
Unbound value mi_funcion

(*Abrir el módulo para cargar permanentemente:*)
open mi_modulo;;
funcion;;
(*- : _ -> _ = <fun>*)

(*En programación funcional existen valores y funciones
  de las cuales sus resultados dependen del estado del 
  programa.*)

(*Crear una variable:*)
(*En OCaml es obligatorio asignar un valor para inicializar*)

ref;;
- : 'a -> 'a ref = <fun>

ref 7;;
- : int ref = {contents = 7}

let n = ref 1;;
val n : int ref = {contents = 1}

n;;
- : int ref = {contents = 1}

n+1;;
(*Error de tipos, espera int y recibe int ref*)

(!);;
- : 'a ref -> 'a = <fun>

!n;;
- : int = 1

!n + 2;;
- : int = 3

(:=);;
- : 'a ref -> 'a -> unit = <fun>

n := 8;;
- : unit = ()
!n;;
- : int = 8

(*Crear una funcion de contador:*)

let n = ref 0;;
val n : int ref = {contents = 0}

let next () = 
  let _ = n := !n +1 i
  !n;;

val next : unit -> int = <fun>

next ();;
- : int = 1

next ();;
- : int = 2

next ();;
- : int = 3

...

(*Lo mismo que: Usando el operador (;)*)

let next2 () = 
  n := !n + 1;
  !n;;

next2 ();;
- : int = 4 

