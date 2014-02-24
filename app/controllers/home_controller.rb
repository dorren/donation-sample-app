class HomeController < ApplicationController
  def index
    @donations = current_user.donations.all
  end
end
