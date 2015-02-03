module BikeTransport

  def take_bike_from(container, bike)
    container.release(bike)
    self.dock(bike)
  end

  def release_bike_to(container, bike)
    self.release(bike)
    container.dock(bike)
  end

end