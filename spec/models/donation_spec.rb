require 'spec_helper'

describe Donation do
  context "create" do
    let(:physical) { Physical.new(length: 3, width: 4, height: 5, weight: 10) }

    it "should create physical donation" do
      donation = Donation.new(title: "physical donation", description: "food")
      donation.detail = physical
      donation.save!

      donation = Donation.find(donation.id)
      detail = donation.detail
      expect(donation.detail_type).to eq detail.class.name
      expect(detail).not_to be_nil
      expect(detail.length).to eq 3
    end

    it "should set detail's donation_id" do
      donation = Donation.new(title: "physical donation", description: "food")
      donation.detail = physical
      donation.save!

      expect(donation.detail.donation).to eq donation
    end
  end

end
