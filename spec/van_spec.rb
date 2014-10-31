# require 'van'

# describe Van do

# 	let(:station) {double :station}
# 	let(:broken_bike) {double :bike, broken?: true}
# 	let(:working_bike) {double :bike, broken?: false}
# 	let(:van) {Van.new}

# 	it "should dock a broken bike from the station" do
# 		expect(station).to receive(:release)
# 		van.transfer_from(station, broken_bike)
# 	end

# 	it "should have a bike after the transfer from the station" do
# 		allow(station).to receive(:release)
# 		van.transfer_from(station, broken_bike)
# 		expect(van.bikes.count).to eq(1)
# 	end

# end