let hd lst =
  match lst with
  | [] -> failwith "Lista vacía, no hay primer elemento"
  | x :: _ -> x
;;

let tl lst =
  match lst with
  | [] -> failwith "Lista vacía, no hay elementos para quitar"
  | _ :: rest -> rest
;;

let rec length lst =
  match lst with
  | [] -> 0
  | _ :: rest -> 1 + length rest
;;

let compare_lengths l1 l2 =
  compare (length l1) (length l2)
;;

let compare_length_with lst n =
  compare (length lst) n
;;
  
let rec init len f =
  if len <= 0 then []
  else f (len - 1) :: init (len - 1) f
;;

let rec nth lst n =
  match lst with
  | [] -> failwith "Índice fuera de rango"
  | x :: rest ->
    if n = 0 then x
    else nth rest (n - 1)
;;

let rec append lst1 lst2 =
  match lst1 with
  | [] -> lst2
  | x :: rest -> x :: append rest lst2
;;

let rev_append lst1 lst2 =
  let rec rev_aux acc lst =
    match lst with
    | [] -> acc
    | x :: rest -> rev_aux (x :: acc) rest
  in
  rev_aux lst2 (rev_aux [] lst1)
;;

let rev lst =
  let rec rev_aux acc lst =
    match lst with
    | [] -> acc
    | x :: rest -> rev_aux (x :: acc) rest
  in
  rev_aux [] lst
;;

let rec concat lst_of_lsts =
  match lst_of_lsts with
  | [] -> []
  | lst :: rest -> append lst (concat rest)
;;

let rec flatten lst_of_lsts =
  match lst_of_lsts with
  | [] -> []
  | lst :: rest -> append lst (flatten rest)
;;

let rec split lst =
  match lst with
  | [] -> ([], [])
  | (a, b) :: rest ->
    let (lst_a, lst_b) = split rest in
    (a :: lst_a, b :: lst_b)
;;

let rec combine lst1 lst2 =
  match (lst1, lst2) with
  | ([], []) -> []
  | (x1 :: rest1, x2 :: rest2) -> (x1, x2) :: combine rest1 rest2
  | _ -> failwith "Listas de longitud diferente"
;;

let rec map f lst =
  match lst with
  | [] -> []
  | x :: rest -> f x :: map f rest
;;

let rec map2 f lst1 lst2 =
  match (lst1, lst2) with
  | ([], []) -> []
  | (x1 :: rest1, x2 :: rest2) -> f x1 x2 :: map2 f rest1 rest2
  | _ -> failwith "Listas de longitud diferente"
;;

let rev_map f lst =
  let rec rev_map_aux acc lst =
    match lst with
    | [] -> acc
    | x :: rest -> rev_map_aux (f x :: acc) rest
  in
  rev_map_aux [] lst
;;

let rec for_all f lst =
  match lst with
  | [] -> true
  | x :: rest -> f x && for_all f rest
;;

let rec exists f lst =
  match lst with
  | [] -> false
  | x :: rest -> f x || exists f rest
;;

let rec mem a set =
  match set with
  | [] -> false
  | x :: rest -> a = x || mem a rest
;;

let rec find f lst =
  match lst with
  | [] -> failwith "Ningún elemento satisface el predicado"
  | x :: rest -> if f x then x else find f rest
;;

let find f lst =
  let rec find_aux acc l =
    match l with
    | [] -> acc
    | x :: rest ->
      if f x then x
      else find_aux acc rest
  in
  match lst with
  | [] -> failwith "Ningún elemento satisface el predicado"
  | x :: rest -> find_aux x rest
;;

let rec find f lst =
  match lst with
  | [] -> failwith "Ningún elemento satisface el predicado"
  | x :: rest ->
    if f x then x
    else find f rest
;;

let filter f lst =
  let rec filter_aux acc l =
    match l with
    | [] -> List.rev acc
    | x :: rest ->
      if f x then filter_aux (x :: acc) rest
      else filter_aux acc rest
  in
  filter_aux [] lst
;;

let find_all f lst =
  let rec find_all_aux acc l =
    match l with
    | [] -> List.rev acc
    | x :: rest ->
      if f x then find_all_aux (x :: acc) rest
      else find_all_aux acc rest
  in
  find_all_aux [] lst
;;

let partition f lst =
  let rec partition_aux acc_true acc_false l =
    match l with
    | [] -> (List.rev acc_true, List.rev acc_false)
    | x :: rest ->
      if f x then partition_aux (x :: acc_true) acc_false rest
      else partition_aux acc_true (x :: acc_false) rest
  in
  partition_aux [] [] lst
;;

let rec fold_left f acc lst =
  match lst with
  | [] -> acc
  | x :: rest -> fold_left f (f acc x) rest
;;

let rec fold_right f lst init =
  match lst with
  | [] -> init
  | x :: rest -> f x (fold_right f rest init)
;;

let rec assoc a lst =
  match lst with
  | [] -> failwith "Clave no encontrada en la lista"
  | (key, value) :: rest ->
    if key = a then value
    else assoc a rest


let assoc a lst =
  let rec assoc_aux acc l =
    match l with
    | [] -> failwith "Clave no encontrada en la lista"
    | (key, value) :: rest ->
      if key = a then value
      else assoc_aux acc rest
  in
  assoc_aux lst lst
;;

let mem_assoc a lst =
  let rec mem_assoc_aux l =
    match l with
    | [] -> false
    | (key, _) :: rest ->
      if key = a then true
      else mem_assoc_aux rest
  in
  mem_assoc_aux lst
;;

let rec remove_assoc a lst =
  match lst with
  | [] -> []
  | (key, value) :: rest ->
    if key = a then rest
    else (key, value) :: remove_assoc a rest
;;

