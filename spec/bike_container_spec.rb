shared_examples 'a Bike Container' do
  
  let(:holder)              {described_class.new}

  it 'should have no bikes when initialized' do
    expect(holder.bikes?.count).to eq 0
  end

end