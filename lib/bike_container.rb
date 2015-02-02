module BikeContainer

  attr_reader :capacity

  def initialize
    @bikes = []
    @capacity = 10
  end

  def bikes?
    @bikes
  end

  def dock(bike)
    raise 'Docking Station is full' if @bikes.count >= @capacity
    @bikes << bike
  end

  def release(bike)
    raise 'Docking Station is empty' if @bikes.count === 0
    @bikes.delete(bike)
  end

end