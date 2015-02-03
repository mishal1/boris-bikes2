require 'docking_station'

describe DockingStation do

  it_behaves_like 'a Bike Container'

  let(:docking_station) {DockingStation.new}
  let(:user)            {double :user, is_a?: User}

  it 'should have a defualt capacity of 10 bikes' do
    expect(docking_station.capacity).to eq 10
  end

end