class Voucher < ActiveRecord::Base
  attr_accessible :expires_at

  belongs_to :donation
end
