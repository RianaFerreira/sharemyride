class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def new
    @driver_trips = Trip.where(driver_id: current_user.id)

    @trip = Trip.new
    @locationA = Location.new
    @locationA.trip_position = 0
    @locationB = Location.new
    @locationB.trip_position = 1
    @trip.locations << @locationA
    @trip.locations << @locationB
  end

  def create
    @trip = Trip.new(params[:trip])
    @trip.driver_id = current_user.id

    #raise 'err'
    if @trip.save
      redirect_to new_trip_path
    else
      #logger.debug @trip.errors.to_json
      render :action => :new
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])

    if @trip.update_attributes(params[:trip])
      redirect_to new_trip_path
    else
      render :action => :edit
    end
  end

  def destroy
    @trip = Trip.find(params[:id])

    if @trip.destroy
      redirect_to new_trip_path
    else
      render :action => :edit
    end
  end

end