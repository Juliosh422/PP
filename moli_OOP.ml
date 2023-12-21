let counter = object
	val mutable n = 0
	method next = n <- n + 1 : n
	method reset = n <- 0
end;;

let doble o = 2 * o#next;;

let counter'(*'*) = object
	val mutable n = 100
	method next = n <- n+2 ; n
end;;

class new_counter = object
	val mutable n = 0
	method next = n <- n + 1 : n
	method reset = n <- 0
end;;

class counter_with_set = object
	inherit counter
	method set x = n <- x
end;;
