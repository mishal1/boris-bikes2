class Van
  include BikeContainer

  def dock_from(docking_station, bike)
    docking_station.release(bike)
    self.dock(bike)
  end

  def release_to(docking_station, bike)
    self.release(bike)
    docking_station.dock(bike)
  end

end