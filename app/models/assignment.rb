class Assignment < ActiveRecord::Base

  belongs_to :location
  validates_presence_of :location, :message => "This assignment could not be created. Location can't be blank"
  validates_presence_of :role, :message => "This assignment could not be created. Role can't be blank"
                        validates :role,  uniqueness: {scope: :location_id}


end