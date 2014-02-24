class Physical < ActiveRecord::Base
  attr_accessible :height, :length, :weight, :width

  belongs_to :donation
end
