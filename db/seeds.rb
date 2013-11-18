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

t1 = Trip.create(:dept_date => '01-01-2014', :num_seats => '2', :seat_cost => '50.50', :status => 'scheduled')
t1.driver_id = u1.id
t2 = Trip.create(:dept_date => '20-12-2013', :num_seats => '3', :seat_cost => '25.50', :status => 'scheduled')
t2.driver_id = u1.id
t3 = Trip.create(:dept_date => '30-11-2013', :num_seats => '1', :seat_cost => '40.50', :status => 'scheduled')
t3.driver_id = u2.id

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

l1 = Location.create(:trip_position => '1', :name => 'Sydney', :address => '138 Carillon Avenue, Newtown, NSW, 2042', :lat => '-33.890937', :long => '151.180755')
l1.trip_id = t1.id
l2 = Location.create(:trip_position => '2', :name => 'Melbourne', :address => '220 Barkly St, St Kilda, VIC, 3182', :lat => '-37.871161', :long => '144.980772')
l2.trip_id = t1.id
l3 = Location.create(:trip_position => '1', :name => 'Perth', :address => '58 Kent St, Rockingham, WA, 6168', :lat => '-32.273835', :long => '115.734203')
l3.trip_id = t2.id
l4 = Location.create(:trip_position => '2', :name => 'Fremantle', :address => '79 South Terrace, Fremantle, WA, 6160', :lat => '-32.058628', :long => '115.750704')
l4.trip_id = t2.id
l5 = Location.create(:trip_position => '3', :name => 'Hillarys', :address => '3 Brighton Mews, Hillarys, WA, 6025', :lat => '-31.80767', :long => '115.73412')
l5.trip_id = t2.id
l6 = Location.create(:trip_position => '1', :name => 'Sydney', :address => '604 Harris St, Ultimo, NSW, 2007', :lat => '-33.880276', :long => '151.200326')
l6.trip_id = t3.id
l7 = Location.create(:trip_position => '2', :name => 'Forster', :address => 'Tuncurry Golf Course, Tuncurry, NSW, 2428', :lat => '-32.157305', :long => '152.500327')
l7.trip_id = t3.id
l8 = Location.create(:trip_position => '3', :name => 'Byron Bay', :address => 'Suffolk Park, NSW, 2481', :lat => '-28.677788', :long => '153.616573')
l8.trip_id = t3.id