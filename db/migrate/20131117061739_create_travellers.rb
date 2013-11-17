class CreateTravellers < ActiveRecord::Migration
  def change
    create_table :travellers do |t|
      t.string :role
      t.string :name
      t.integer :num_seats
      t.belongs_to :user
      t.belongs_to :trip
      t.timestamps
    end
  end
end
