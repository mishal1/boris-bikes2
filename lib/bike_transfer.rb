module BikeTransport

  def take_bike_from(container, bike)
    raise 'That bike is broken!' if bike.broken?
    container.release(bike)
    self.dock(bike)
  end

  def release_bike_to(container, bike)
    self.release(bike)
    container.dock(bike)
  end

end