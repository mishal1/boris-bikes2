class User

  include BikeContainer
  include BikeTransport

  def initialize
    super
    @capacity = 1
  end

  def break_bike
    @bikes.first.break!
  end

end