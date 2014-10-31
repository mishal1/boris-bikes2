require './lib/bike_container'

class ClassHolder; include BikeContainer; end

describe BikeContainer do

	let(:holder) {ClassHolder.new}
	let(:working_bike) { double :bike, broken?: false, is_a?: true}
	let(:broken_bike) {double :bike, broken?: true, is_a?: true}
	let(:van) {double :van}


	def fill(bike)
		holder.capacity.times {holder.dock(bike)}
	end

#holder.capacity.times => sets times to whatever capacity is set to	

	def holder_dock(bike)
		lambda {holder.dock(bike)}
	end

	def holder_release(bike)
		lambda {holder.release(bike)}
	end

	it "should accept a bike" do
		expect(holder.bikes.count).to eq(0)
		holder.dock(working_bike)
		expect(holder.bikes.count).to eq(1)
	end

	it "should dock a bike" do
		expect(holder.bikes.count).to eq(0)
		holder.dock(working_bike)
		expect(holder.bikes.count).to eq(1)
	end

	it "should release bikes" do 
		holder.dock(working_bike)
		holder.release(working_bike)
		expect(holder.bikes.count).to eq(0)
	end

	it "should know when it is full" do
		fill(working_bike)
		expect(holder.full?).to be true
	end

	it "should know when it is empty" do
		expect(holder.empty?).to be true
	end

	it "should know not to dock a bike if holder is full" do
		fill(working_bike)
		expect(holder_dock(working_bike)).to raise_error(RuntimeError)
	end

	it "should not release bike if holder is empty" do
		expect(holder_release(working_bike)).to raise_error(RuntimeError)
	end


	it 'should give a list of broken bikes' do
		holder.dock(working_bike)
		holder.dock(broken_bike)
		expect(holder.broken_bikes).to eq([broken_bike])
    end

   	it 'should give a list of available bikes' do
   		holder.dock(working_bike)
   		holder.dock(broken_bike)
   		expect(holder.available_bikes).to eq([working_bike])
   	end

   	it 'should not dock things which are not bikes' do
   		expect(lambda {holder.dock(:not_a_bike)}).to raise_error(RuntimeError)
   	end
	# it "should transfer only broken bikes to the van" do
	# 	holder.dock(broken_bike)
	# 	holder.dock(working_bike)
	# 	allow(van).to receive(:dock)
	# 	holder.transfer_to(van)
	# 	expect(holder.bikes.count).to eq(1)
	# end

	# it "should receive a fixed bike from the van" do
	# 	allow(van).to receive(:release).and_return(working_bike)
	# 	holder.transfer_from(van, working_bike)
	# 	expect(holder.bikes.count).to eq(1)
	# end
end
