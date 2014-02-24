class Donation < ActiveRecord::Base
  attr_accessible :description, :title

  belongs_to :user
  belongs_to :detail, polymorphic: true, dependent: :destroy

  after_create :set_detail_donation

  def set_detail_donation
    detail.donation = self
    detail.save
  end
end
