require 'spec_helper'
require 'bike'

describe Bike do

  let(:bike) {Bike.new}
  let(:break_bike) {bike.break}
    
  it 'should not be broken when initialized' do
    expect(bike.broken).to be false
  end

  it 'should be able to break' do
    break_bike
    expect(bike.broken).to be true
  end

  it 'should be able to be fixed' do 
    break_bike
    bike.fix
    expect(bike.broken).to be false
  end

end