shared_examples 'a Bike Container' do
  
  let(:holder)          {described_class.new}
  let(:bike)            {double :bike, broken: true}

  it 'should have no bikes when initialized' do
    expect(holder.bikes.count).to eq 0
  end

  it 'should be able to dock a bike' do
    holder.dock(bike)
    expect(holder.bikes.count).to eq 1
  end

  it 'should be able to release a bike' do
    holder.dock(bike)
    holder.release(bike)
    expect(holder.bikes.count).to eq 0
  end

  it 'should not dock a bike if the holder is full' do
    capacity = holder.capacity
    capacity.times {holder.dock(bike)}
    expect{holder.dock(bike)}.to raise_error(RuntimeError)
  end

  it 'should should not release a bike if there are no bikes' do 
    expect{holder.release(bike)}.to raise_error(RuntimeError)
  end

end