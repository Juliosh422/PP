let come (i1, j1) (i2, j2) =
  i1 = i2 || j1 = j2 || abs (i1 - i2) = abs (j1 - j2)
;;

let compatible p l =
  not (List.exists (come p) l)
;;

let queens n =
  let rec completar path i j =
    if i > n then [path]
    else if j > n then []
    else if compatible (i, j) path then
      completar (path @ [(i, j)]) (i + 1) 1 @ completar path i (j + 1)
    else
      completar path i (j + 1)
  in
  completar [] 1 1
;;

let rec conflict (i1, j1) = function
  | [] -> false
  | (i2, j2) :: rest ->
      i1 = i2 || j1 = j2 || abs (i1 - i2) = abs (j1 - j2) || conflict (i1, j1) rest

let is_queens_sol n sol =
  let rec no_conflict = function
    | [] -> true
    | pos :: rest -> not (conflict pos rest) && no_conflict rest
  in
  if List.length sol <> n then false
  else no_conflict sol


let check n = List.for_all (is_queens_sol n) (queens n);;
List.for_all check (List.init 13 abs);;

is_queens_sol 2 [(1, 1); (2, 3)];;