# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Trip.destroy_all
Passenger.destroy_all
Location.destroy_all

#drivers
u1 = User.create(:email => 'riana@gmail.com', :password => 'password')
u2 = User.create(:email => 'fuzzy@gmail.com', :password => 'password')
#passenger
u3 = User.create(:email => 'mojo@gmail.com', :password => 'password')

t1 = Trip.create(:dept_date => '01-01-2014', :total_seats => '2', :seat_cost => '50.50')
t1.driver_id = u1.id
t1.save
t2 = Trip.create(:dept_date => '20-12-2013', :total_seats => '3', :seat_cost => '25.50')
t2.driver_id = u1.id
t2.save
t3 = Trip.create(:dept_date => '30-11-2013', :total_seats => '1', :seat_cost => '40.50')
t3.driver_id = u2.id
t3.save

p1 = Passenger.new
p1.user_id = u2.id
p1.trip_id = t1.id
p1.save

p2 = Passenger.new
p2.user_id = u3.id
p2.trip_id = t2.id
p2.save

p3 = Passenger.new
p3.user_id = u1.id
p3.trip_id = t3.id
p3.save

l1 = Location.create(:trip_position => '0', :name => 'Sydney', :lat => '-33.890937', :long => '151.180755')
l1.trip_id = t1.id
l1.save
l2 = Location.create(:trip_position => '1', :name => 'Melbourne', :lat => '-37.871161', :long => '144.980772')
l2.trip_id = t1.id
l2.save
l3 = Location.create(:trip_position => '0', :name => 'Perth', :lat => '-32.273835', :long => '115.734203')
l3.trip_id = t2.id
l3.save
l4 = Location.create(:trip_position => '1', :name => 'Fremantle', :lat => '-32.058628', :long => '115.750704')
l4.trip_id = t2.id
l4.save
l5 = Location.create(:trip_position => '0', :name => 'Sydney', :lat => '-33.880276', :long => '151.200326')
l5.trip_id = t3.id
l5.save
l6 = Location.create(:trip_position => '1', :name => 'Forster', :lat => '-32.157305', :long => '152.500327')
l6.trip_id = t3.id
l6.save