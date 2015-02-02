class DockingStation

  def initialize
    @bikes = []
  end

  def bikes?
    @bikes
  end

  def dock(bike)
    raise 'Docking Station is full' if @bikes.count >= 10
    @bikes << bike
  end

  def release(bike)
    raise 'Docking Station is empty' if @bikes.count === 0
    @bikes.delete(bike) unless bike.broken?
  end

end