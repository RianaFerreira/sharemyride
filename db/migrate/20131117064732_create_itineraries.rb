class CreateItineraries < ActiveRecord::Migration
  def change
    create_table :itineraries do |t|
      t.string :location_type
      t.belongs_to :trip
      t.belongs_to :location
      t.timestamps
    end
  end
end