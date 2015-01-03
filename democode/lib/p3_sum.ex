defmodule P3_sum do
	
	# the easy way
	def sum1(from, to) do
		Enum.sum(from..to)
	end


	# call reduce using a named function
	def sum2(from, to) do
		# &1 is the number to add, &2 is accumulator
		# &add is called function capture
		Enum.reduce(from..to, &add(&1, &2))
	end

	defp add(a,b) do
		a+b
	end

	# call reduce with anonymous function
	def sum3(from, to) do
		Enum.reduce(from..to, fn(a,b) -> a+b end)
	end

	# call reduce with anonymous function shortcut
	def sum4(from, to) do
		Enum.reduce(from..to, &(&1 + &2))
	end

	# implement sum reducer
	def sum5(from, to) do
		sum5_list(Enum.to_list(from..to), 0)
	end
	# notice the pattern matching
	defp sum5_list([], total), do: total
	defp sum5_list([head | tail], total), do: sum5_list(tail, head + total)

	# notice the use of _ to separate digits
	def sumOfMillion, do: sum1(1, 1000_000)

end