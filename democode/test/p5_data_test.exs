defmodule P5_dataTest do
	use ExUnit.Case
	import P5_data

	test "createBook" do
  		book = createBook("t", "a", 42)
  		assert Map.get(book, :price) == 42
	end

	test "bookDb" do
		db= bookDb(5)
		assert length(db) == 5
	end

	test "findBooksWithinPriceRange" do
		db= bookDb(10)
		found = findBooksWithinPriceRange(db, 30, 50)
		assert length(found) == 3
	end

	test "priceOf" do
		db = bookDb(3)
		assert priceOf(db) == 60
	end

	test "applyTax" do
		assert applyTax(20, 10.0) == 22
	end

	test "shipping" do
		assert shipping(40) == 45
		assert shipping(400) == 410
	end

	test "transaction" do
		assert transaction1 == 245.4
		assert transaction2 == 245.4
	end

end
