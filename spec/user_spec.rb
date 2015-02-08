require 'spec_helper'
require 'user'

describe User do

  it_behaves_like 'a Bike Container'
  it_behaves_like 'Bike Transfer'

  let(:user)        {User.new}
  let(:container)   {double :container}
  let(:bike)        {double :bike, broken: false}
  let(:broken_bike) {double :bike, broken: true}

  it 'should have a defualt capacity of 10 bikes' do 
    expect(user.capacity).to eq 1
  end

  it 'should not receive a bike if it is broken' do
    allow(container).to receive(:release).with(broken_bike)
    expect{user.take_bike_from(container, broken_bike)}.to raise_error(RuntimeError)
  end

  it 'should be able to break bike' do
    allow(container).to receive(:release).with(bike)
    user.take_bike_from(container, bike)
    expect(bike).to receive(:break)
    user.break_bike
  end
  
end