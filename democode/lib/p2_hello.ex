defmodule P2_hello do

	def hello1 do
		IO.puts "hello1 world"
	end

	def hello2 do
		# return the last statment 
		"hello2 world"
	end

	@doc """
	Returns a string concat of hello3 and the given argument
	`what` a string argument to be added to hello3

	Use "mix docs" to genrate docs
	"""
	def hello3(what \\ "world") do
		# note string concatenation
		"hello3 " <> what
	end

	def hello4 do
		hello4_private   # perenthisis are optional
	end

	defp hello4_private do
		"Nǐ hǎo shìjiè"
	end

	# shortcut for simple functions
	def hello5, do: "hola mundo"

	# multi line strings
	def hello6 do
		"""
		hello6
		world
		"""
	end

	@hello_world7 "مرحبا بالعالم"  # constant
	def hello7, do: @hello_world7

	def hello8 do
		# Anonymous function
		hw = fn -> "hello8 world" end
		hw.()
	end

	def hello9 do
		list = ["hello9", "world"]
		Enum.join(list, " ")
	end

	def hello10(language) do
		# atoms are constants where their name is their own value.
		map = %{:english => "hello10 world", :klingon => "qo vIvan" }
		IO.puts map.english
		map[language]
	end

end
