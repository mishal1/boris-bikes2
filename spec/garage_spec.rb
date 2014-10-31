require 'garage'

describe Garage do
	
let(:station) {DockingStation.new}
	let(:broken_bike) {double :bike, broken?: true, is_a?: true}
	let(:working_bike) {double :bike, broken?: true, is_a?: true}
	let(:van) {double :van}

	it "should include a BikeContainer class" do
		station.dock(working_bike)
		expect(station.bikes.count).to eq(1)
	end

end