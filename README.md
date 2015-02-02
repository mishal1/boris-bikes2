Boris Bikes2
==============
boris bikes ruby practice

##CR Cards


###Bike Class

it should:
- work on initialization
- can break

it interacts with:
- Docking Station

###Docking Station Class

it should:
- accept bike
- release bike
- know when it is full
- not accept a bike when it is full
- know when it is empty
- not release a bike when it is empty
- not release a broken bike
- transfer broken bikes

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
