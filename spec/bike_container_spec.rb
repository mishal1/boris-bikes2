shared_examples 'a Bike Container' do
  
  let(:holder)          {described_class.new}
  let(:bike)            {double :bike, broken?: true}
  let(:dock_bike)       {holder.dock(bike)}
  let(:release_bike)    {holder.release(bike)}

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

  it 'can have a set capacity' do
    holder_with_capacity = described_class.new(20)
    expect(holder_with_capacity.capacity).to eq(20)
  end

end