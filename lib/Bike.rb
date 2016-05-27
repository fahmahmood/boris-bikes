class Bike

attr_reader :broken, :bike_working
	
	def initialize
		@bike_working = true
	end 


	def working?
		true
	end

	def report_broken
		@bike_working = false
	end 

	def broken?
		!@bike_working
	end 

end 
