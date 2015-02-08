require 'spec_helper'

describe 'integration test' do
  
  before(:each) do
    @bike = Bike.new
    @broken_bike = Bike.new
    @broken_bike.break
    @van = Van.new
    @garage = Garage.new
    @user = User.new
    @docking_station = DockingStation.new
    @docking_station.dock(@bike)
    @docking_station.dock(@broken_bike)
  end

  def user_takes_bike
    @user.take_bike_from(@docking_station, @bike)
  end

  def test_bike_count(holder1, holder2, count1, count2)
    expect(holder1.bikes.count).to eq count1
    expect(holder2.bikes.count).to eq count2
  end

  def van_takes_bike
    @van.take_bike_from(@docking_station, @broken_bike)
  end

  def drop_off_bike_to_garage
    van_takes_bike
    @van.release_bike_to(@garage, @broken_bike)
  end

  it 'a docking station should have bikes' do
    expect(@docking_station.bikes.count).to eq 2
  end

  it 'a user can take a bike from the docking station' do
    user_takes_bike
    test_bike_count(@user, @docking_station, 1, 1)
  end

  it 'a user cannot take a broken bike from the docking station' do
    expect{@user.take_bike_from(@docking_station, @broken_bike)}.to raise_error(RuntimeError)
    expect(@docking_station.bikes.count).to eq 2
  end

  it 'a user can break a bike' do
    user_takes_bike
    @user.break_bike
    expect(@user.bikes.first.broken).to eq true
  end

  it 'a user can return a bike to the docking station' do
    user_takes_bike
    @user.release_bike_to(@docking_station, @bike)
    test_bike_count(@user, @docking_station, 0, 2)
  end

  it 'a van can pick up bikes from the docking station' do
    van_takes_bike
    test_bike_count(@van, @docking_station, 1, 1)
  end

  it 'a van can return a bike to the docking station' do 
    van_takes_bike
    @van.release_bike_to(@docking_station, @broken_bike)
    test_bike_count(@van, @docking_station, 0, 2)
  end

  it 'a van can drop off a bike to the garage' do
    drop_off_bike_to_garage
    test_bike_count(@van, @garage, 0, 1)
  end

  it 'a van can pick up a bike from the garage' do
    drop_off_bike_to_garage
    @van.take_bike_from(@garage, @broken_bike)
    test_bike_count(@van, @garage, 1, 0)
  end

  it 'a garage can fix a broken bike' do
    drop_off_bike_to_garage
    @garage.fix_bikes
    expect(@garage.bikes.first.broken).to eq false
  end

end