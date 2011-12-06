require 'spec_helper'
require 'capybara_helper'

feature "User logic" do
  
  scenario "User signs in" do
    log_in("user")
    page.should have_content("user@doitlater.com")
  end
  
  scenario "User registrates" do
    visit("/users/sign_up")
    user_email = "user2@doitlater.com"
    fill_and_submit_form("#user_new", {
        "user_email" => user_email,
        "user_password" => "1234567",
        "user_password_confirmation" => "1234567"
    })
    page.should have_content(user_email)
  end
  
  scenario "User registrates" do
    visit("/users/sign_up")
    user_email = "user2@doitlater.com"
    fill_and_submit_form("#user_new", {
        "user_email" => user_email,
        "user_password" => "1234567",
        "user_password_confirmation" => "1234567"
    })
    page.should have_content(user_email)
  end
  
  scenario "Sign out" do
    log_in("user")
    click_link "Exit"
    page.should have_content("Sign in")
  end
  
  
end