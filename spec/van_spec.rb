# require 'van'

# describe Van do

# 	let(:broken_bike) {double :bike, :broken? => true}
# 	let(:transfer_to) {double :transfer_to, :dock => broken_bike}
# 	let(:station) {double :station}

# 	it "should dock a broken bike from the station" do
# 		station.transfer_to(broken_bike)
# 		expect(van.bikes.count).to eq(1)
# 	end

# end