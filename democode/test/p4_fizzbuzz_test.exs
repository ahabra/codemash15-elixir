defmodule P4_fizzbuzzTest do
	use ExUnit.Case
 	import P4_fizzbuzz


	test "fb1" do
		assert fb1(1) == "1"
		assert fb1(2) == "2"
		assert fb1(3) == "fizz"
		assert fb1(5) == "buzz"
		assert fb1(6) == "fizz"
		assert fb1(10) == "buzz"
		assert fb1(15) == "fizzbuzz"
	end

	test "fb2" do
		assert fb2(1) == "1"
		assert fb2(2) == "2"
		assert fb2(3) == "fizz"
		assert fb2(5) == "buzz"
		assert fb2(6) == "fizz"
		assert fb2(10) == "buzz"
		assert fb2(15) == "fizzbuzz"
	end


	# it is boring to repeat the same assert code for each implementation
	# assertFizzbuzz/1 fixes that
	test "fb3" do
		assertFizzbuzz(&fb3/1)
	end

	test "fb4" do
		assertFizzbuzz(&fb4/1)
	end

	test "fb5" do
		assertFizzbuzz(&fb5/1)
	end

	test "fb6" do
		assertFizzbuzz(&fb6/1)
	end

	def assertFizzbuzz(fun) do
		assert fun.(1) == "1"
		assert fun.(2) == "2"
		assert fun.(3) == "fizz"
		assert fun.(5) == "buzz"
		assert fun.(6) == "fizz"
		assert fun.(10) == "buzz"
		assert fun.(15) == "fizzbuzz"
	end

end
