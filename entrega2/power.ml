let rec power x y =
  if (y <= 0) then 1
  else x*power x (y-1);;

let rec power' x y =
  let isEven n = (n mod 2) == 0 in
  if (y<=0) then 1 else
    if (isEven y) then power' (x*x) (y/2)
    else x*power' (x*x) (y/2);;

let rec powerf x y =
  if(y <= 0) then 1.
  else x *. powerf x (y-1);;

  