# == Schema Information
#
# Table name: locations
#
#  id            :integer          not null, primary key
#  trip_position :integer
#  name          :string(255)
#  address       :text
#  lat           :string(255)
#  long          :string(255)
#  trip_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Location < ActiveRecord::Base
  # mass data assignment allowed for these attributes
  attr_accessible :trip_position, :name, :address, :lat, :long, :trip_id

  # table associations
  belongs_to :trip

  # db validations applied to attributes

end
