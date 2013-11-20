class TripsController < ApplicationController

  def show
    # find a selected trip
    @trip = Trip.find(params[:id])
  end

  def index
    # instead of finding all trips only find those >= today
    @trips = Trip.where('dept_date > ?', Time.now.beginning_of_day).order(:dept_date)
  end

  def search
    # look for all trips based on search criteria
    raise params.inspect
  end

  def new
    # find all pending trips for a driver
    @driver_trips = Trip.where(driver_id: current_user.id).where('dept_date > ?', Time.now.beginning_of_day).order(:dept_date)

    # initialize a new trip
    @trip = Trip.new
    @locationA = Location.new
    @locationA.trip_position = 0
    @locationB = Location.new
    @locationB.trip_position = 1
    @trip.locations << @locationA
    @trip.locations << @locationB
  end

  def create
    # commit the details of a new trip
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
    # find a selected trip
    @trip = Trip.find(params[:id])
  end

  def update
    # commit changes to an existing trip
    @trip = Trip.find(params[:id])

    if @trip.update_attributes(params[:trip])
      redirect_to new_trip_path
    else
      render :action => :edit
    end
  end

  def destroy
    # remove a selected trip
    @trip = Trip.find(params[:id])

    if @trip.destroy
      redirect_to new_trip_path
    else
      render :action => :edit
    end
  end

end