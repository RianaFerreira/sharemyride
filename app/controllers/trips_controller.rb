class TripsController < ApplicationController
  def new
    @trip = Trip.new
    @locationA = Location.new
    @locationA.trip_position = 0
    @locationB = Location.new
    @locationB.trip_position = 1
    @trip.locations << @locationA
    @trip.locations << @locationB
  end

end