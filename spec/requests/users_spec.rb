require 'spec_helper'

describe "Users" do
  describe 'signup' do

    describe 'failure' do
      it "should not make a new user" do
        lambda do
          visit signup_path
          fill_in 'Name', with: ''
          fill_in 'Email', with: ''
          fill_in 'Password', with: ''
          fill_in 'Confirmation', with: ''
          click_button

          response.should render_template('users/new')
          response.should have_selector('div#error_explaination')
        end.should_not change(User, :count)
      end
    end

    describe 'success' do
      it "should make a new user" do
        lambda do
          visit signup_path
          fill_in 'Name', with: 'Mike Hatfield'
          fill_in 'Email', with: 'mike@example.com'
          fill_in 'Password', with: 'foobar'
          fill_in 'Confirmation', with: 'foobar'
          click_button

          response.should render_template('users/show')
          response.should have_selector("div.flash.success", content: "Welcome")
        end.should change(User, :count).by(1)
      end
    end
  end

  describe 'sign in/out' do
    it "should not sign a user in" do
      integration_sign_in '', ''
      response.should have_selector('div.flash.error', content: 'Invalid')
    end
    
    describe 'success' do
      it "should sign a user in and out" do
        user = Factory(:user)
        integration_sign_in user.email, user.password
        controller.should be_signed_in
        click_link 'Sign out'
        controller.should_not be_signed_in
      end
    end
  end
  
end
