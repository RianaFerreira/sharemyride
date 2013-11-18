class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.datetime :dept_date
      t.integer :num_seats
      t.decimal :seat_cost, precision: 8, scale: 2
      t.string :status
      t.integer :driver_id
      t.timestamps
    end
  end
end
