# == Schema Information
#
# Table name: passengers
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  trip_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Passenger < ActiveRecord::Base
  # mass data assignment allowed for these attributes
  attr_accessible :user_id, :trip_id

  # table associations
  belongs_to :trip
  belongs_to :user

end
