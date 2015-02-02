shared_examples "a BikeContainer" do
  
  let(:holder)              {described_class.new}
  let(:bike)                {double :bike, broken?: false}
  let(:dock_bike)           {holder.dock(bike)}
  let(:release_bike)        {holder.release(bike)}
  let(:broken_bike)         {double :bike, broken?: true}
  let(:release_broken_bike) {holder.release(broken_bike)}

  it 'should have no bikes when initialized' do
    expect(holder.bikes?.count).to eq 0
  end

  it 'should be able to dock a bike' do
    dock_bike
    expect(holder.bikes?.count).to eq 1
  end

  it 'should be able to release a bike' do
    dock_bike
    release_bike
    expect(holder.bikes?.count).to eq 0
  end

  it 'should not dock a bike if the docking station is full' do
    10.times {holder.dock(bike)}
    expect{holder.dock(bike)}.to raise_error(RuntimeError)
  end

  it 'should should not release a bike if there are no bikes' do 
    expect{release_bike}.to raise_error(RuntimeError)
  end

  it 'should not release a broken bike' do
    expect{release_broken_bike}.to raise_error(RuntimeError)
  end

end