require 'docking_station'
describe 'docking_station' do

	let(:bike) { bike = Bike.new}
	let(:docking_station) { docking_station = Docking_station.new }
	
	it "should accept bikes" do
		expect(self.docking_station.bikes.count).to eq(0)
		docking_station.dock(bike)
		expect(self.docking_station.bikes.count).to eq(1)
	end

end