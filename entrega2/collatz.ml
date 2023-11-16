let f n = if n mod 2 = 0 then n / 2 else 3 * n + 1;;

let rec orbit i =
  let f n = if n mod 2 = 0 then n / 2 else 3 * n + 1 in
  let rec recorbit s i =
    if i = 1 then 
      s ^ string_of_int i
    else
      recorbit (s ^ string_of_int (i) ^ ", ") (f i)
  in 
    recorbit "" i
;;

let rec length n =
  if n = 1 then
    0
  else if n mod 2 = 0 then
    1 + length (n / 2)
  else
    1 + length (3 * n + 1)
;;


let rec top i =
  let f n = if n mod 2 = 0 then n / 2 else 3 * n + 1 in
  let rec maxof m num = 
    if num = 1 then
      max m num
    else
      maxof (max m num) (f num)
  in
  maxof i i
;;

let rec length'n'top n =
  let rec lat num m =
    if num = 1 then
      (0, m)
    else
      let next_num = if num mod 2 = 0 then num / 2 else 3 * num + 1 in
      let new_max = max m next_num in
      let (length, top) = lat next_num new_max in
      (length + 1, top)
  in
  lat n n
;;

let rec longest_in m n =
  let rec clength num =
    if num = 1 then
      0
    else if num mod 2 = 0 then
      1 + clength (num / 2)
    else
      1 + clength (3 * num + 1)
  in

  let rec find_longest minact lonact numact =
    if minact > n then
      (numact, lonact)
    else
      let cclength = clength minact in
      if cclength > lonact then
        find_longest (minact + 1) cclength minact
      else
        find_longest (minact + 1) lonact numact
  in

  find_longest m 0 m
;;

let rec highest_in m n =
  let rec ctop num topact =
    if num = 1 then
      topact
    else
      let next_num = if num mod 2 = 0 then num / 2 else 3 * num + 1 in
      let new_top = max topact next_num in
      ctop next_num new_top
  in

  let rec find_highest minact topact numact =
    if minact > n then
      (numact, topact)
    else
      let cctop = ctop minact minact in
      if cctop > topact then
        find_highest (minact + 1) cctop minact
      else
        find_highest (minact + 1) topact numact
  in

  find_highest m 0 m
;;
