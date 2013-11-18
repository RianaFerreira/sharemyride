class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :trip_position
      t.string :name
      t.text :address
      t.string :lat
      t.string :long
      t.belongs_to :trip
      t.timestamps
    end
  end
end
