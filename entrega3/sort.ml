let rec insert x = function
[]->[x]
| h::t -> if x <= h then x :: h :: t 
else h::insert x t
;;

let rec isort = function
[] -> []
|h::t -> insert h (isort t)
;;

let rec create_big_list acc n =
  if n <= 0 then acc
  else create_big_list (n :: acc) (n - 1)
;;
  
let bigl = create_big_list [] 99999999;;



let insert_t x lst =
  let rec insertHelper acc = function
    | [] -> List.rev (x :: acc)
    | h :: t ->
      if x >= h then List.rev_append acc (x :: h :: t)
      else insertHelper (h :: acc) t
  in
  insertHelper [] lst
;;

let isort_t lst =
  let rec insertInSorted acc x = function
    | [] -> List.rev_append acc [x]
    | h :: t ->
      if x >= h then List.rev_append acc (x :: h :: t)
      else insertInSorted (h :: acc) x t
  in
  let rec isortHelper acc = function
    | [] -> List.rev acc
    | h :: t -> isortHelper (insertInSorted [] h acc) t
  in
  isortHelper [] lst
;;

let rlist x =
  let rec aux n list = 
    if n >= x then list else
      let res = List.append list [(Random.int (x*2))] in
      aux (n+1) res
  in
  aux 0 [];;

let asclist x =
  let rec aux n list = 
    if n >= x then list else
      let res = List.append list [n] in
      aux (n+1) res
  in
  aux 0 [];;

let desclist x =
  let rec aux n list =
    if n<=0  then list else
      let res = List.append list [n] in
      aux (n-1) res
  in
  aux x [];;

let lc1 = asclist 10000
and lc2 = asclist 20000
and ld1 = desclist 10000
and ld2 = desclist 20000
and lr1 = rlist 10000
and lr2 = rlist 20000;;


let check f1 f2 l1 =
  f1(l1)=f2(l1);;

let check_all f1 f2 =
  (check f1 f2 lc1)&&
  (check f1 f2 lc2)&&
  (check f1 f2 ld1)&&
  (check f1 f2 ld2)&&
  (check f1 f2 lr1)&&
  (check f1 f2 lr2)
;;

(**Medición de tiempos**)

let crono f x =
  let t = Sys.time () in
  let _ = f x in
  Sys.time () -. t
;;

(*isort 10k elementos ascendente:*)
crono isort lc1;;   (*0.00207*)
(*isort 20k elementos ascendente:*)
crono isort lc2;;   (*0.00247*)
(*isort_t 10k elementos ascendente:*)
crono isort_t lc1;; (*0.00145*)
(*isort_t 20k elementos ascendente:*)
crono isort_t lc2;; (*0.00297*)

(*En el caso ascendente no me fío demasiado de las
  mediciones, ya que por optimizaciones de hardware
  en portátiles, las velocidades del procesador pueden
  cambiar repentinamente durante la ejecución. La
  ordenación es muy rápida porque no realiza a penas
  operaciones.*)

(*isort 10k elementos descendente:*)
crono isort ld1;;   (*1.932*)
(*isort 20k elementos descendente:*)
crono isort ld2;;   (*9.934*)
(*isort_t 10k elementos descendente:*)
crono isort_t ld1;; (*3.141*)
(*isort_t 20k elementos descendente:*)
crono isort_t ld2;; (*15.237*)

(*Con sólo estas mediciones no se puede demostrar que
  el crecimiento de tiempo respecto al tamaño sea
  exponencial, pero dada la naturaleza de los algoritmos
  queda claro que sigue esa complejidad de O(n²). Ya que
  por cada elemento realiza un recorrido
  completo de la lista (n*n). *)

(*isort 10k elementos aleatorio:*)
crono isort lr1;;   (*0.984*)
(*isort 20k elementos aleatorio:*)
crono isort lr2;;   (*4.295*)
(*isort_t 10k elementos aleatorio:*)
crono isort_t lr1;; (*1.530*)
(*isort_t 20k elementos aleatorio:*)
crono isort_t lr2;; (*8.152*)

(*Aquí se vuelve a observar que los tiempos crecen bastante
  rápido pero no se puede demostrar la complejidad cuadrática
  de forma experimental, pero sí de forma empírica. isort
  siempre va a ser más rápida ya que realiza menos
  operaciones por iteración que isort_t. A pesar de ello, por
  la implementación recursiva terminal, isort_t es más fiable
  para listas mucho más grandes. *)

let rec isort_g cmp lst =
  let rec insertBy cmp x lst = match lst with
    | [] -> [x]
    | h :: t ->
    if cmp x h then x :: lst
    else h :: insertBy cmp x t
  in
  let rec isortHelper acc = function
    | [] -> acc
    | h :: t -> isortHelper (insertBy cmp h acc) t
  in
  isortHelper [] lst
;;

(*isort_g (fun x y -> x<y) [1;3;2;5;4;7;8;6;10];;*)

let rec split l = match l with
h1::h2::t -> let t1, t2 = split t
in h1::t1, h2::t2
| _ -> l, []
let rec merge (l1,l2) = match l1, l2 with
[], l | l, [] -> l
| h1::t1, h2::t2 -> if h1 <= h2 then h1 :: merge (t1, l2)
else h2 :: merge (l1, t2)
let rec msort l = match l with
[] | [_] -> l
| _ -> let l1, l2 = split l
in merge (msort l1, msort l2)
;;

check_all msort isort;; 
(*- : bool = true*)

let bigl2 = bigl;;

let split_t lst =
  let rec splitAcc acc1 acc2 = function
    | [] -> (List.rev acc1, List.rev acc2)
    | h1 :: h2 :: t -> splitAcc (h1 :: acc1) (h2 :: acc2) t
    | [x] -> (List.rev (x :: acc1), List.rev acc2)
  in
  splitAcc [] [] lst
;;

let merge_t (lst1, lst2) =
  let rec mergeAcc acc l1 l2 = match l1, l2 with
    | [], l | l, [] -> List.rev_append acc l
    | h1 :: t1, h2 :: t2 ->
      if h1 <= h2 then mergeAcc (h1 :: acc) t1 l2
      else mergeAcc (h2 :: acc) l1 t2
  in
  mergeAcc [] lst1 lst2
;;

let rec msort' l = match l with
[] | [_] -> l
| _ -> let l1, l2 = split_t l
in merge_t (msort' l1, msort' l2)
;;

let rec split lst = match lst with
  | [] | [_] -> lst, []
  | h1 :: h2 :: t ->
    let t1, t2 = split t in
    h1 :: t1, h2 :: t2
;;

let rec merge cmp lst1 lst2 = match lst1, lst2 with
  | [], l | l, [] -> l
  | h1 :: t1, h2 :: t2 ->
    if cmp h1 h2 then h1 :: merge cmp t1 lst2
    else h2 :: merge cmp lst1 t2
;;

let bigl3 = bigl2;;

let rec msort_g cmp lst =
  match lst with
  | [] | [_] -> lst
  | _ ->
    let l1, l2 = split lst in
    merge cmp (msort_g cmp l1) (msort_g cmp l2)
;;

