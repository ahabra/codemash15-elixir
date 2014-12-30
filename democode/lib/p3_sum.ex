defmodule P3_sum do
	
	# the easy way
	def sum1(from, to) do
		Enum.sum(from..to)
	end

	# call reduce with anonymous function
	def sum2(from, to) do
		Enum.reduce(from..to, fn(a,b) -> a+b end)
	end

	# call reduce with anonymous function shortcut
	def sum3(from, to) do
		Enum.reduce(from..to, &(&1 + &2))
	end

	# implement sum reducer
	def sum4(from, to) do
		sum4_list(Enum.to_list(from..to), 0)
	end
	# notice the pattern matching
	defp sum4_list([], total), do: total
	defp sum4_list([head | tail], total), do: sum4_list(tail, head + total)

	# notice the use of _ to separate digits
	def sumOfMillion, do: sum1(1, 1000_000)

end