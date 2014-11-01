require 'garage'

describe Garage do

	it_behaves_like 'BikeContainer'
	
	let(:broken_bike)  {double :bike, broken?: true, is_a?: true}
	let(:working_bike) {double :bike, broken?: false, is_a?: true}
	let(:van)          {double :van}
	let(:garage)       {Garage.new}

#it can accept a broken bike from the van
#the van can fix the bike
	it "can fix a broken bike" do
		garage.dock(broken_bike)
		garage.fix!
		expect(garage.broken?).to be false
	end

end