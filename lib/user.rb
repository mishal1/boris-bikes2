class User

  include BikeContainer
  include BikeTransport

  def capacity
    1
  end

  def break_bike
    @bikes.first.break!
  end

  def take_bike_from(container, bike)
    raise 'That bike is broken!' if bike.broken?
    super
  end

end