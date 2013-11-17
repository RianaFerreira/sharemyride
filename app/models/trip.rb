# == Schema Information
#
# Table name: trips
#
#  id                 :integer          not null, primary key
#  departure_date     :datetime
#  departure_location :string(255)
#  arrival_location   :string(255)
#  available_seats    :integer
#  seat_cost          :decimal(8, 2)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Trip < ActiveRecord::Base
  attr_accessible :departure_date, :departure_location, :arrival_location, :available_seats, :seat_cost, :user_id
  belongs_to :user
  validates :departure_date, :departure_location, :arrival_location, :available_seats, :seat_cost, :presence => true

end
