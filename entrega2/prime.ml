let rec next_prime x =
  let is_prime n =
    let rec check_from i =
      i >= n || (n mod i <> 0 && check_from (i + 1))
    in
    check_from 2
  in
  if x < 1 || is_prime (x + 1) then
    x + 1
  else
    next_prime (x + 1);;

let rec last_prime_to n = 
  let is_prime n =
    let rec check_from i =
    i >= n ||
    (n mod i <> 0 && check_from (i+1))
    in check_from 2 in
  if (n<1 || is_prime n) then n 
  else last_prime_to (n-1);;

  let is_prime n =
    let rec check_from i =
    i >= n ||
    (n mod i <> 0 && check_from (i+1))
    in check_from 2 ;;

let rec is_prime2 n =
  if n<= 1 then false
  else let rec check_from i =
    i * i >n||(n mod i<>0&&check_from(i+1)) in
    check_from 2;;

