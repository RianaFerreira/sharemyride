class CreatePassengers < ActiveRecord::Migration
  def change
    create_table :passengers do |t|
      t.belongs_to :user
      t.belongs_to :trip
      t.timestamps
    end
  end
end
