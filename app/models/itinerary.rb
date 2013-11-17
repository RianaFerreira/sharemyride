# == Schema Information
#
# Table name: itineraries
#
#  id            :integer          not null, primary key
#  location_type :string(255)
#  trip_id       :integer
#  location_id   :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Itinerary < ActiveRecord::Base
  # mass data assignment allowed for these attributes
  attr_accessible :location_type, :trip_id, :location_id

  # table associations
  belongs_to :trip
  belongs_to :location

end
