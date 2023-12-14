type 'a bintree = Empty | Node of 'a * 'a bintree * 'a bintree;;

let in_order tree =
  let rec aux subtree =
    match subtree with
    | Empty -> []
    | Node (v, i, d) ->
      let list_i = aux i in
      let list_v = List.append list_i [v] in
      list_v @ (aux d)
  in
  aux tree
;;

let rec insert ord tree x = 
  let rec aux subtree = 
    match subtree with
    | Empty -> Node (x, Empty, Empty)
    | Node (v, i, d) ->
      if ord x v then
        Node (v, aux i, d)
      else
        Node (v, i, aux d)
  in
  aux tree
;;

let bst ord list =
  let rec aux sublist result=
    match sublist with
    | [] -> result
    | h::t ->
    aux t (insert ord result h)
  in
  aux list Empty
;;

let qsort ord lst =
  let bst_insert = bst ord lst in
  in_order bst_insert
;;
