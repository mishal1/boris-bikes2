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
    raise 'Holder is full' if @bikes.count >= @capacity
    @bikes << bike
  end

  def release(bike)
    raise 'Holder is empty' if @bikes.count === 0
    @bikes.delete(bike)
  end

end