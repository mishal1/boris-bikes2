require "/Users/Mishal/Documents/code/makers/boris-bikes2/lib/bike_container.rb"
require "/Users/Mishal/Documents/code/makers/boris-bikes2/lib/bike.rb"

class Garage
	include BikeContainer

	def fix(bike)
		bike.fix!
	end
end
