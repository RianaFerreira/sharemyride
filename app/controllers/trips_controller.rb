  class TripsController < ApplicationController
  before_filter :load_driver_trips, :only => [:new, :create]

  def load_driver_trips
    @driver_trips = Trip.where(driver_id: current_user.id).where('dept_date > ?', Time.now.beginning_of_day).order(:dept_date)
  end

  def show
    # find a selected trip
    @trip = Trip.find(params[:id])

    respond_to do |format|
      format.json { render :json => @trip, :include => :locations }
      format.html
    end
  end

  def index
    # instead of finding all trips only find those >= today
    @trips = Trip.where('dept_date > ?', Time.now.beginning_of_day).where.not(user_id: current_user.id).order(:dept_date)
  end

  def search
    # if the date search parameter is supplied
    if params[:date].present?
      # get all the trips on or after the supplied date
      @trips = Trip.where('dept_date >= ?', params[:date])
    else
      # get all the trips after today
      @trips = Trip.where('dept_date > ?', Time.now.beginning_of_day).order(:dept_date)
    end

    # if the departure location is supplied
    if params[:depart].present?
      # get all the trips with the supplied departure location
      depart = params[:depart]
      @trips = @trips.select do |trip|
        depart.in?(
          trip.locations.where(:trip_position => 0).map(&:name)
        )
      end
    end

    # if the destination location is supplied
    if params[:destination].present?
      # get all the trips with the supplied destination location
      destination = params[:destination]
      @trips = @trips.select do |trip|
        destination.in?(
          trip.locations.where(:trip_position => 1).map(&:name)
        )
      end
    end
    #raise params.inspect

    render :index
  end

  def new
    # find seats a driver has booked
    @booked_seats = Passenger.where(:user_id => current_user.id).map(&:trip)

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
    @trip = Trip.new(params[:trip])
    @trip.driver_id = current_user.id

    if @trip.save
      redirect_to new_trip_path
    else
      @booked_seats = Passenger.where(:user_id => current_user.id).map(&:trip)
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

  def book
    @trip = Trip.find(params[:id])
    if @trip.seats_available > 0
      @passenger = Passenger.new

      @passenger.trip_id = @trip.id
      @passenger.user_id = current_user.id
      @passenger.save

      @trip.seats_available -= 1
      @trip.save
    end

    respond_to do |format|
      format.json { render :json => @trip }
    end

  end
end
