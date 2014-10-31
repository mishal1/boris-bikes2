# require 'docking_station'

# describe 'DockingStation' do

# 	let(:working_bike) { double :bike, broken?: false}
# 	let(:broken_bike) {double :bike, broken?: true}
# 	let(:station) { DockingStation.new(capacity: 10)}
# 	let(:van) {double :van}

# 	def fill(bike)
# 		10.times {station.dock(bike)}
# 	end

# 	def station_dock(bike)
# 		lambda {station.dock(bike)}
# 	end

# 	def station_release(bike)
# 		lambda {station.release(bike)}
# 	end
	
# 	it "should dock a bike" do
# 		expect(station.bikes.count).to eq(0)
# 		station.dock(working_bike)
# 		expect(station.bikes.count).to eq(1)
# 	end

# 	it "should release bikes" do 
# 		station.dock(working_bike)
# 		station.release(working_bike)
# 		expect(station.bikes.count).to eq(0)
# 	end

# 	it "should know when it is full" do
# 		fill(working_bike)
# 		expect(station.full?).to be true
# 	end

# 	it "should know when it is empty" do
# 		expect(station.empty?).to be true
# 	end

# 	it "should know not to dock a bike if station is full" do
# 		fill(working_bike)
# 		expect(station_dock(working_bike)).to raise_error(RuntimeError)
# 	end

# 	it "should not release bike if station is empty" do
# 		expect(station_release(working_bike)).to raise_error(RuntimeError)
# 	end

# 	it "should not release broken bikes" do
# 		station.dock(broken_bike)
# 		expect(station_release(broken_bike)).to raise_error(RuntimeError)
# 	end

# 	it "docking station should not have any broken bikes once they are transfered" do 
# 		fill(broken_bike)
# 		expect(station.bikes.count).to eq(10)
# 		allow(van).to receive(:dock)
# 		station.transfer_to(van)
# 		expect(station.bikes.count).to eq(0)
# 	end	

# 	it "should transfer only broken bikes to the van" do
# 		station.dock(broken_bike)
# 		station.dock(working_bike)
# 		allow(van).to receive(:dock)
# 		station.transfer_to(van)
# 		expect(station.bikes.count).to eq(1)
# 	end

# 	it "should receive a fixed bike from the van" do
# 		allow(van).to receive(:release).and_return(working_bike)
# 		station.transfer_from(van, working_bike)
# 		expect(station.bikes.count).to eq(1)
# 	end

# 	#example of to receive and with
# 	#receive a bike from van
# end


# #rspec method- change example in steve boris bike