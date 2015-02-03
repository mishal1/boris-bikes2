require 'van'

describe Van do
  
  it_behaves_like 'a Bike Container'

  it_behaves_like 'Bike Transfer'

  let(:holder)          {described_class.new}

  it 'should have a defualt capacity of 10 bikes' do 
    expect(holder.capacity).to eq 10
  end

end