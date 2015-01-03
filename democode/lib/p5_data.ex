defmodule P5_data do

	defmodule Book do
		defstruct title: "", author: "", price: 0 
	end

	def createBook(title, author, price) do
		%Book{title: title, author: author, price: price}
	end

	def createDbBook(number) do
		n = to_string(number)
		createBook("t"<>n, "a"<>n, number*10)
	end

	def bookDb(numberOfBooks) do
		range = 1..numberOfBooks
		Enum.map range, &(createDbBook(&1))
	end

	def findBooksWithinPriceRange(books, min, max) do
		Enum.filter(books, fn(book) ->
			book.price >= min and book.price <= max
		end)
	end

	def priceOf(books) do
		Enum.reduce(books, 0, fn(book, acc) -> acc + book.price end)
	end

	def applyTax(price, taxPercent) do
		price + price * taxPercent/100
	end

	def shipping(totalPrice) do
		if totalPrice < 100, do: totalPrice+5, else: totalPrice+10
	end

	def transaction1 do
		db = bookDb(10)
		found = findBooksWithinPriceRange(db, 40, 70)
		price = priceOf(found)
		withTax = applyTax(price, 7)
		shipping(withTax)
	end

	def transaction2 do
		bookDb(10)
		|> findBooksWithinPriceRange(40, 70)
		|> priceOf
		|> applyTax(7)
		|> shipping
	end

end