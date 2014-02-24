require 'spec_helper'

feature 'donations' do
  background do
    @user = User.create(email: 'me@here.com', password: '12345678')
    @donation = Donation.new(title: 'donation 1', description: 'description 1')
    @donation.detail = Experience.new(contact_name: 'me', latitude: '40.7527903', longitude: '-73.9748389,17')
    @donation.user = @user
    @donation.save!
  end

  scenario 'index page' do
    capybara_sign_in(@user)
    visit root_path
    page.should have_content('donation 1')

  end

  scenario 'show experience map' do
    capybara_sign_in(@user)
    visit donation_path(@donation.id)
    page.should have_css("#gmap_canvas")
  end
end
