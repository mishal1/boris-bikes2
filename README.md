Boris Bikes2
==============
boris bikes ruby practice

##CRC Cards


###Bike Class

it should:
- work on initialization
- can break

it interacts with:
- Docking Station

###User Class

it should:
- have no bikes when initialized
- be able to take a bike from the docking station
- be able to dock a bike at the docking station
- be able to break a bike

it interacts with:
- Docking Station
- Bike

###Docking Station Class

it should:
- accept bike
- release bike
- know when it is full
- not accept a bike when it is full
- know when it is empty
- not release a bike when it is empty
- not release a broken bike to a user

it interacts with:
- Bike
- Van

###Van Class

it should:
- accept a bike from the station
- release a bike to the garage
- accept a bike from the garage
- release a bike to the station

it interacts with:
- Bike
- Garage
- Docking Station


###Garage Class

it should:
- accept a broken bike from the van
- fix the bike
- release a fixed bike to the van
- know when it is full
- not accept a bike when it is full
- know when it is empty
- not release a bike when it is empty

it interacts with:
- Bike
- Van
