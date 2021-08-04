require 'rails_helper'

# RSpec.feature "Users", type: :feature do
  # context 'create new user' do
  #   scenario 'should be successful' do
  #     visit new_user_registration_path
  #     within('form') do
  #       fill_in 'Username', with: 'shar'
  #       fill_in 'Email', with: 'shar@gmail.com'
  #       fill_in 'Password', with: 'shar123'
  #       fill_in 'Password confirmation', with: 'shar123'
  #     end
  #     click_button 'Sign up'
  #   end
    

   
  # end
  feature 'Integration test walkthrough' do
    background do
      user = User.new(username: 'jean', password: '123456', email: 'com')
      visit new_user_registration_path
      fill_in 'user_username', with: user.username
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      fill_in 'user_password_confirmation', with: user.password
      click_button 'Sign up'
    end

    scenario 'cannot access root path without proper sign up' do
      visit root_path
      expect(page).to have_content('Log in')
    end
  end


# end
