require 'bike'
describe Bike do

	let(:bike){Bike.new}
	let(:break!){bike.break!}

	it "should not be broken on initialization" do
		expect(bike.broken?).to be false
	end

	it "should break" do
		break!
		expect(bike.broken?).to be true
	end

	it "should fix" do
		break!
		bike.fix!
		expect(bike.broken?).to be false
	end

end