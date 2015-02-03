require 'bike_transfer'

shared_examples 'Bike Transfer' do

  let(:holder)          {described_class.new}
  let(:bike)            {double :bike}
  let(:docking_station) {double :docking_station}
  let(:dock_bike)       {holder.take_bike_from(docking_station, bike)}
  let(:release_bike)    {holder.release_bike_to(docking_station, bike)}

  def dock_bike_into_holder
    allow(docking_station).to receive(:release).with(bike)
    dock_bike
  end

  it 'should take a bike from a bike container' do
    expect(docking_station).to receive(:release).with(bike)
    dock_bike
  end

  it 'should dock a bike in the holder' do
    dock_bike_into_holder
    expect(holder.bikes?.count).to eq 1
  end

  it 'should dock a bike at a bike container' do
    dock_bike_into_holder
    expect(docking_station).to receive(:dock).with(bike)
    release_bike
  end

  it 'should release a bike from the holder' do
    dock_bike_into_holder
    allow(docking_station).to receive(:dock).with(bike)
    release_bike
    expect(holder.bikes?.count).to eq 0
  end

end