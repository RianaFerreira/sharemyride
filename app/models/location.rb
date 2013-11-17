# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  lat        :string(255)
#  long       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Location < ActiveRecord::Base
  # mass data assignment allowed for these attributes
  attr_accessible :name, :lat, :long

  # table associations
  has_many :itineraries
  has_many :trips, :through => :itinerary

  # db validations applied to attributes

end
