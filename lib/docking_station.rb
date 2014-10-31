require "./lib/bike_container"

class DockingStation
	include BikeContainer

	attr_reader :bikes

	DEFAULT_VALUE = 10

	def initialize(option = {})
		@bikes =[]
		@capacity = option.fetch(:capacity, DEFAULT_VALUE)
	end


end