

let rec reverse x = let rec digits_of n =
   if abs(n)<10 then 1
   else 1+digits_of (n/10) in
   if abs(x) < 10 then abs x
   else
     let n = digits_of x in
     ((x mod 10) * int_of_float (10. ** float_of_int (n-1))) + reverse (x / 10);;

reverse 4321;;

reverse 0b100000;;

let rec palindromo s =
   if String.length s <=1 then true
   else s.[0]==s.[String.length s -1]&&palindromo(String.sub s 1 (String.length s - 2));;

palindromo "radar";;

let rec mcd (a, b) = 
   if b = 0 then a  
   else mcd (b, a mod b);;
   
mcd (48,18)