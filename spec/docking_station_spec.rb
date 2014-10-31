require 'docking_station'
require_relative 'bike_container_spec'

describe DockingStation do

	it_behaves_like 'BikeContainer'

	let(:station) {DockingStation.new}
	let(:broken_bike) {double :bike, broken?: true, is_a?: true}
	let(:working_bike) {double :bike, broken?: true, is_a?: true}
	let(:van) {double :van}

	it "should include a BikeContainer class" do
		station.dock(working_bike)
		expect(station.bikes.count).to eq(1)
	end

	# it "can release a bike from the van" do
	# 	expect(van).to receive(:release)
	# 	station.move_from(station)
	# end

end


# #rspec method- change example in steve boris bike