let fibto x =
  let rec fib n =
    if n <= 1 then n
    else fib (n-1) + fib (n-2) in
  let rec rfib i =
    let result = fib i in
    if result > x then ()
    else begin
    print_endline(string_of_int (result));
    rfib (i+1) end in
  rfib 0;;  

let caller s =
  if Array.length s = 2 then
    fibto (int_of_string s.(1))
  else
    print_endline "fibto: Invalid number of arguments";;

caller Sys.argv;;