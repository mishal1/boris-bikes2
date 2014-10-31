require "./lib/bike_container"

class Van
	include BikeContainer

	def collect_broken_bikes_from(container)
		container.broken_bikes.each do |broken_bike|
			container.release(broken_bike)
			dock(broken_bike)
		end
	end

	def drop_off_broken_bikes_to(container)
		self.broken_bikes.each do |bike|
			self.release(bike)
			container.dock(bike)
		end
	end

end