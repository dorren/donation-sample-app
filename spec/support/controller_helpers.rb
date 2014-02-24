  module ControllerHelpers
    def sign_in(user = double('user'))
      if user.nil?
        request.env['warden'].stub(:authenticate!).
          and_throw(:warden, {:scope => :user})
        controller.stub :current_user => nil
      else
        request.env['warden'].stub :authenticate! => user
        controller.stub :current_user => user
      end
    end

    def capybara_sign_in(user)
      visit root_path
      fill_in "user[email]", with: user.email
      fill_in "user[password]", with: '12345678'
      click_button 'Sign in'
    end
  end
