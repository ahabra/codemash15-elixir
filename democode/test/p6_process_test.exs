defmodule P5_processTest do
	use ExUnit.Case
	import P6_process

	test "createThenKill" do
		n = 25  #0_000
		IO.puts inspect :timer.tc(P6_process, :createThenKill, [n])
	end

end