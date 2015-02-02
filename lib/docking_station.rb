require_relative './bike_container.rb'

class DockingStation 
  include BikeContainer

  # def release(bike)
  #   raise 'That bike is broken' if bike.broken?
  #   super
  # end

end