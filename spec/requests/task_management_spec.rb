require 'spec_helper'
require 'capybara_helper'

feature "Task management", :js => true do
  
  before(:each) do
    User.find_by_email("user@doitlater.com").roles.create!(:name => "user")
    User.find_by_email("user@doitlater.com").goals.create!(:title => "do smth", :role_id => Role.find_by_name("user").id, :date => "12.07.2011", :repeat_schedule => "weekly", :priority => "week")
  end
  
  scenario "Adding role" do
    log_in("user")
    visit("/#!/role/")
    role = "Some role"
    fill_form("#new_role", {
        "role_name" => role
    })
    page.find(".add-role").click
    page.should have_content(role)
  end
  
  scenario "Adding task" do
    log_in("user")
    visit("/#!/goal/")
    goal = "Do smth"
    fill_form("#new_goal", {
        "goal_title" => goal
    })
    page.find(".add-goal").click
    page.should have_content(goal)
  end

  scenario "Editing task" do
    log_in("user")
    visit("/#!/goal/1")
    goal_title = "Edited goal"
    fill_form("#new_goal", {
        "goal_title" => goal_title
    })
    page.find(".edit-goal").click
    page.should have_content(goal_title)
  end

  scenario "Delete task", :focus => true, :pending => true do
    log_in("user")
    visit("/#!/goal/1")
    page.find(".delete-goal").click
    page.should_not have_content("do smth")
  end

  
end