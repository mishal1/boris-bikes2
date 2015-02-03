module BikeContainer

  DEFAULT_CAPACITY = 10

  attr_accessor :capacity

  def capacity
    capacity ||= DEFAULT_CAPACITY
  end

  def bikes
    @bikes ||=[]
  end

  def dock(bike)
    raise 'Holder is full' if bikes.count >= capacity
    bikes << bike
  end

  def release(bike)
    raise 'Holder is empty' if bikes.count === 0
    @bikes.delete(bike)
  end

end