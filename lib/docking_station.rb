class DockingStation

	attr_reader :bikes
	attr_accessor :transfers

	DEFAULT_VALUE = 10
	def initialize(option = {})
		@bikes =[]
		@transfers =[]
		@capacity = option.fetch(:capacity, DEFAULT_VALUE)

	end

	def dock(bike)
		raise "Docking Station is full" if full?
		@bikes << bike
	end

	def release(bike)
		raise "Docking Station is empty" if empty?
		@bikes.delete(bike) if bike.broken? == false
		raise "Bike is broken" if bike.broken?
	end

	def full?
		@bikes.count >= @capacity
	end

	def empty?
		@bikes.count == 0
	end

	def transfer_to(container)
		bikes.each do |bike|
			bikes.delete(bike) if bike.broken?
			container.dock(bike) if bike.broken?
		end
	end

end