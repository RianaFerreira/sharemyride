# == Schema Information
#
# Table name: trips
#
#  id         :integer          not null, primary key
#  dept_date  :datetime
#  num_seats  :integer
#  seat_cost  :decimal(8, 2)
#  driver_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Trip < ActiveRecord::Base
  # mass data assignment allowed for these attributes
  attr_accessible :dept_date, :num_seats, :seat_cost, :driver_id, :locations_attributes

  # table associations
  has_many :passengers
  has_many :locations
  belongs_to :driver, :foreign_key => 'driver_id', :class_name => 'User'
  accepts_nested_attributes_for :locations

  # db validations applied to attributes
  validates :dept_date, :num_seats, :seat_cost, :presence => true

  def start_point
    locations.where(:trip_position => 0).first
  end

  def end_point
    locations.where(:trip_position => 1).first
  end
end
