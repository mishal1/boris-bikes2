require 'docking_station'

describe DockingStation do

  it_behaves_like 'a Bike Container'

  let(:docking_station) {DockingStation.new}

  it 'should have a defualt capacity of 10 bikes' do
    expect(docking_station.capacity).to eq 10
  end

  # it 'should not release a broken bike' do
  #   docking_station = DockingStation.new
  #   docking_station.dock(broken_bike)
  #   expect{docking_station.release(broken_bike)}.to raise_error(RuntimeError)
  # end

end