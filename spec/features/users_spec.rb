require 'rails_helper'

feature 'Integration test walkthrough' do
  background do
    user = User.new(username: 'elvis', password: 'elvis123', email: 'com')
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

  scenario 'cannot access groups path' do
    visit groups_path
    expect(page).not_to have_content('All Groups')
  end

  
end
