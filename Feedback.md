what you did well
------------------

* very nice modal effect for showing the map, I particularly like how I can click anywhere else to cancel the modal. A lot of them force you to click on a close button which I hate
* nice use of gems and plugins, especially the autocomplete
* it's responsive!

where you could take the project further
----------------------------------------

* I like it if I can click on the logo to go back to the home page, it's a nice common usability touch worth considering
* may be a few suggested trips in the home page, this is more of a personal thing
* It's nice you have added some ajax but there is no feedback for the user when I click something until I realised I booked 5 times
* ability to cancel booking?
* more consistent user experience, for example I cannot confidently guess what some links will take me

some notes about your code
---------------------------

* general very readable code so well done, except new.html.erb is a bit long, could have refactor this a bit more like you did else where.

* you already apologized for the search method in the trips controller :)


A possible refactoring for the trips controller new action as well, from this:

    # initialize a new trip
    @trip = Trip.new
    @locationA = Location.new
    @locationA.trip_position = 0
    @locationB = Location.new
    @locationB.trip_position = 1
    @trip.locations << @locationA
    @trip.locations << @locationB


To this:

    @trip = Trip.new
    @trip.locations.build(:trip_posistion => 0)
    @trip.locations.build(:trip_posistion => 1)

