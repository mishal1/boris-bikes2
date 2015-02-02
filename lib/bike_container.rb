module BikeContainer

  attr_reader :capacity

  def initialize(capacity = 10)
    @bikes = []
    @capacity = capacity
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