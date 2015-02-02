require 'garage'

describe Garage do

  it_behaves_like 'a Bike Container'

  let(:garage)      {Garage.new}
  let(:broken_bike) {double :bike, broken?: true}

  it 'should fix a bike' do
    garage.dock(broken_bike)
    expect(broken_bike).to receive(:fix!)
    garage.fix_bikes
  end
  
end