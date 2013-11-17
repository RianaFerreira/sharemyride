# == Schema Information
#
# Table name: travellers
#
#  id         :integer          not null, primary key
#  role       :string(255)
#  name       :string(255)
#  num_seats  :integer
#  user_id    :integer
#  trip_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Traveller < ActiveRecord::Base
  # mass data assignment allowed for these attributes
  attr_accessible :role, :name, :num_seats, :user_id, :trip_id

  # table associations
  belongs_to :trip
  belongs_to :user

end
