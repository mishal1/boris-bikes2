class Garage
  include BikeContainer

  def capacity
    20
  end

  def dock(bike)
    raise "The bike is not broken" if bike.broken == false
    super
  end

  def fix_bikes
    @bikes.each do |bike| 
      bike.fix
    end
  end

end