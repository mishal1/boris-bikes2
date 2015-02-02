require 'docking_station'

describe DockingStation do

  it_behaves_like 'a Bike Container'

  let(:docking_station) {DockingStation.new}
  let(:bike)            {double :bike, broken?: false}
  let(:dock_bike)       {docking_station.dock(bike)}
  let(:release_bike)    {docking_station.release(bike)}
  # let(:broken_bike) {double :bike, broken?: true}

  it 'should be able to dock a bike' do
    dock_bike
    expect(docking_station.bikes?.count).to eq 1
  end

  it 'should be able to release a bike' do
    dock_bike
    release_bike
    expect(docking_station.bikes?.count).to eq 0
  end

  it 'should not dock a bike if the docking station is full' do
    10.times {docking_station.dock(bike)}
    expect{docking_station.dock(bike)}.to raise_error(RuntimeError)
  end

  it 'should should not release a bike if there are no bikes' do 
    expect{release_bike}.to raise_error(RuntimeError)
  end

  # it 'should not release a broken bike' do
  #   docking_station = DockingStation.new
  #   docking_station.dock(broken_bike)
  #   expect{docking_station.release(broken_bike)}.to raise_error(RuntimeError)
  # end

end