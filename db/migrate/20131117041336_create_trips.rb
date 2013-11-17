class CreateTrips < ActiveRecord::Migration

  def change
    create_table :trips do |t|
      t.datetime :departure_date
      t.string :departure_location
      t.string :arrival_location
      t.integer :available_seats
      t.decimal :seat_cost, precision: 8, scale: 2
      t.timestamps
    end
  end

end
