require 'van'

describe Van do

	it_behaves_like 'BikeContainer' 

	let(:van)           { Van.new                                        }
	let(:broken_bike_1) { double :bike, broken?: true, is_a?: true       }
	let(:broken_bike_2) { double :bike, broken?: true, is_a?: true       }
	let(:working_bike)  { double :bike, broken?: false, is_a?: true      }
	let(:old_street)    { double :station, broken_bikes: [broken_bike_1, broken_bike_2] }
	let(:garage)        {double :garage, available_bikes: [working_bike]   }

	it 'can collect broken bikes from a station' do
		# we need a station with broken bikes
		# the van collect those bikes
		# we expect the van to have those bikes
		expect(old_street).to receive(:release).with(broken_bike_1)
		expect(old_street).to receive(:release).with(broken_bike_2)

		van.collect_broken_bikes_from(old_street)
	end

	it 'has those broken bikes after .... ' do
		allow(old_street).to receive(:release).with(broken_bike_1)
		allow(old_street).to receive(:release).with(broken_bike_2)

		van.collect_broken_bikes_from(old_street)

		expect(van.bikes).to eq [broken_bike_1, broken_bike_2]
	end

	it 'can remove broken bikes once dropped off bikes to the garage' do
		#we expect the van drops off the broken bikes to the garage
		#there will be no bikes in the van
		van.dock(broken_bike_1)
		allow(garage).to receive(:dock).with(broken_bike_1)
		van.drop_off_broken_bikes_to(garage)
		expect(van).to be_empty
	#to be_empty implies empty? method
	end

	it "can drop off the bike to the garage" do 
		van.dock(broken_bike_1)
		expect(garage).to receive(:dock).with(broken_bike_1)
		van.drop_off_broken_bikes_to(garage)
	end
	#we need a garage with fixed bikes
	#we can pick up fixed bikes from the garage
	#we expect the van to have those bikes

	it "can pick up fixed bikes from the garage" do
		expect(garage).to receive(:release).with(working_bike)
		van.collect_working_bikes_from(garage)
	end

	it "can have those bikes after collecting them" do
		allow(garage).to receive(:release).with(working_bike)
		van.collect_working_bikes_from(garage)
		expect(van.bikes).to eq [working_bike]
	end

	it "can remove working bikes once dropped off bikes to the station" do
		van.dock(working_bike)
		allow(old_street).to receive(:dock).with(working_bike)
		van.drop_off_working_bikes_to(old_street)
		expect(van).to be_empty
	end

	it "can drop off the bike to the station" do
		van.dock(working_bike)
		expect(old_street).to receive(:dock).with(working_bike)
		van.drop_off_working_bikes_to(old_street)
	end

end