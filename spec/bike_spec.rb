require 'bike'

describe Bike do

  before(:each) do
    @bike = Bike.new
  end
    
  it 'should not be broken when initialized' do
    expect(@bike.broken?).to be false
  end

  it 'should be able to break' do
    @bike.break!
    expect(@bike.broken?).to be true
  end

end