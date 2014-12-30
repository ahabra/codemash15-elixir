defmodule P4_fizzbuzz do

	# evil
	def fb1(n) do
		if rem(n, 15)==0 do 
			"fizzbuzz"
		else if rem(n,3)==0 do
				"fizz"
			else if rem(n,5)==0 do
					"buzz"
				else
					to_string(n)
				end
			end
		end
	end  # fb1

	# less evil 
	def fb2(n) do
		cond do
			rem(n, 15)==0 ->
				"fizzbuzz"
			rem(n,3)==0 ->
				"fizz"
			rem(n,5)==0 ->
				"buzz"
			true ->
				to_string(n)
		end
	end # fb2

	# good
	def fb3(n) do
		# notice the pattern matching
		case {rem(n,3), rem(n,5) } do
			{0, 0} -> "fizzbuzz"
			{0, _} -> "fizz"
			{_, 0} -> "buzz"
			_ -> to_string(n)
		end
	end

	# classic, function pattern matching
	def fb4(n) when rem(n, 15)==0, do: "fizzbuzz"
	def fb4(n) when rem(n, 3)==0, do: "fizz"
	def fb4(n) when rem(n, 5)==0, do: "buzz"
	def fb4(n), do: to_string(n)


	# geeky, create pocesses
	def fb5(n) do
		fizzbuzzId = spawn fn ->
			receive do
				{parentId, n} when rem(n,15)==0 -> send(parentId, {"fizzbuzz"})
			end
		end
		fizzId = spawn fn ->
			receive do
				{parentId, n} when rem(n,3)==0 -> send(parentId, {"fizz"})
			end
		end
		buzzId = spawn fn ->
			receive do
				{parentId, n} when rem(n,5)==0 -> send(parentId, {"buzz"})
			end
		end
		noFizzId = spawn fn ->
			receive do
				{parentId, n} when rem(n,3)!=0 and rem(n,5)!=0 -> send(parentId, {to_string(n)})
			end
		end


		for id <- [noFizzId, fizzId, fizzbuzzId, buzzId] do
			send id, {self(), n}
		end

		receive do
			{fb} -> fb
		after
			200 -> "timeout, ouch!"
		end
	end


	# lets try to remove duplications
	defp createFbProcess(number, message) do
		spawn fn ->
			receive do
				{parentId, n} when rem(n,number)==0 -> send(parentId, {message})
			end
		end
	end

	defp createDefaultFbProcess(number) do
		spawn fn ->
			receive do
				{parentId, n} when rem(n,3)!=0 and rem(n,5)!=0 -> send(parentId, {to_string(number)})
			end
		end
	end

	def fb6(n) do
		fizzbuzzId = createFbProcess(15, "fizzbuzz")
		fizzId = createFbProcess(3, "fizz")
		buzzId = createFbProcess(5, "buzz")
		noFizzId =  createDefaultFbProcess(n)

		for id <- [noFizzId, fizzId, fizzbuzzId, buzzId], do: (send id, {self(), n})

		receive do
			{fb} -> fb
		after
			200 -> "timeout, ouch!"
		end
	end

end
