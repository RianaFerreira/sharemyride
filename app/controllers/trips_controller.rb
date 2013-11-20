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
    # Sorry about all this, Daniel.
    if params[:date].present?
      @trips = Trip.where('dept_date >= ?', params[:date])
    else
      @trips = Trip.where('dept_date > ?', Time.now.beginning_of_day).order(:dept_date)
    end

    if params[:depart].present?
      # Horrible magic, please disregard.
      depart = params[:depart].split(',')[0] # Just the city please.
      @trips = @trips.select do |trip|
        depart.in?(
          trip.locations.where(:trip_position => 0).map(&:name)
        )
      end
    end

    if params[:destination].present?
      # Horrible magic, please disregard.
      destination = params[:destination].split(',')[0] # Just the city please.
      @trips = @trips.select do |trip|
        destination.in?(
          trip.locations.where(:trip_position => 1).map(&:name)
        ).order(:dept_date)
      end
    end

    if params[:num_seats].present?
      @trips = @trips.select do |trip|
        trip.num_seats == params[:num_seats].to_i
      end
    end

    render :index
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