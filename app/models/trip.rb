# == Schema Information
#
# Table name: trips
#
#  id          :integer          not null, primary key
#  dept_date   :datetime
#  avail_seats :integer
#  seat_cost   :decimal(8, 2)
#  status      :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Trip < ActiveRecord::Base
  # mass data assignment allowed for these attributes
  attr_accessible :dept_date, :avail_seats, :seat_cost, :status

  # table associations
  has_many :travellers
  has_many :users, :through => :travellers

  has_many :itineraries
  has_many :locations, :through => :itineraries

  # db validations applied to attributes
  validates :dept_date, :avail_seats, :seat_cost, :presence => true
end
