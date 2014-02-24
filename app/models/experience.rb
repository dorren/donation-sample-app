class Experience < ActiveRecord::Base
  attr_accessible :contact_name, :latitude, :longitude

  belongs_to :donation
end
