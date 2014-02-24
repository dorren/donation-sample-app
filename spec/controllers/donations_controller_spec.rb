require 'spec_helper'

describe DonationsController do
  let!(:user) { user = User.create(email: 'me@here.com', password: '12345678')}
  let(:experience) {
                    {donation: {title: 'donation 1', description: 'description 1',
                        detail: {contact_name: 'me', latitude: '123', longitude: '234'}},
                     detail_class: 'experience'}
                    }

  it "should create" do
    sign_in user

    post :create, experience
    response.should redirect_to root_path
  end
end

