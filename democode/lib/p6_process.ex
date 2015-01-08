defmodule P6_process do

	def createProcesses(n) do
		processes = for n<- 1..n do
			spawn fn -> 
				receive do
					:stop -> 
				end
			end
		end
		processes
	end

	def stopProcesses(processes) do
		for p <- processes do
			send p, :stop
		end
	end

	def createThenKill(numberOfProcesses) do
		processes = createProcesses(numberOfProcesses)
		stopProcesses(processes)
		"micro-seconds created #{numberOfProcesses} processes"
	end

end