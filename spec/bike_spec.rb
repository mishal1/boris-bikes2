require 'bike'
describe Bike do

	let(:garage) { double :garage }

	it "should not be broken on initialization" do
		bike =Bike.new
		expect(bike.broken?).to be false
	end

	it "should break" do
		bike = Bike.new
		bike.break!
		expect(bike.broken?).to be true
	end

end