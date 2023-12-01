let rec insert x = function
  []->[x]
  | h::t -> if x <= then :: h :: t 
    else h::insert x t

let rec isort = function
  [] -> []
  |h::t -> insert h (isort t)

  let bigl = 