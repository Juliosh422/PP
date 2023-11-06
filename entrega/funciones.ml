let rec sumto = function 1->1 | n -> n+sumto(n-1);;
let rec exp10 = function 0 -> 1 | n when n >= 0 -> 10 * exp10 (n - 1)  | _ -> 0;;
let rec num_cifras n =
  if abs n < 10 then 1
  else 1+num_cifras(abs (n/10));;
let rec sum_cifras n =
  if abs n < 10 then abs n
  else abs(n-(n/10)*10)+sum_cifras(abs(n/10));;