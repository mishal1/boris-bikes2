require 'van'

describe Van do
  
  it_behaves_like 'a Bike Container'

  let(:van)             {Van.new}
  let(:bike)            {double :bike}
  let(:docking_station) {double :docking_station}
  let(:dock_bike)       {van.dock_from(docking_station, bike)}
  let(:release_bike)    {van.release_to(docking_station, bike)}

  def dock_bike_into_van
    allow(docking_station).to receive(:release).with(bike)
    dock_bike
  end

  it 'should take a bike from a bike container' do
    expect(docking_station).to receive(:release).with(bike)
    dock_bike
  end

  it 'should dock a bike in the van' do
    dock_bike_into_van
    expect(van.bikes?.count).to eq 1
  end

  it 'should dock a bike at a bike container' do
    dock_bike_into_van
    expect(docking_station).to receive(:dock).with(bike)
    release_bike
  end

  it 'should release a bike from the van' do
    dock_bike_into_van
    allow(docking_station).to receive(:dock).with(bike)
    release_bike
    expect(van.bikes?.count).to eq 0
  end

  it 'should have a defualt capacity of 10 bikes' do 
    expect(van.capacity).to eq 10
  end

end