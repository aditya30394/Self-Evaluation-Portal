def login_with(email, password)
    go_to_login
    fill_in 'Email', :with => email
    fill_in 'Password', :with => password
    click_button 'Log in'
end

def go_to_login
    visit login_path
end

When(/^I log in with admin's information$/) do
  login_with "admin@admin.com", "123456"
end

When(/^I log in with hanna's information$/) do
  login_with "hanna@tamu.edu", "123456"
end

When(/^I go check the log in page$/) do
  visit login_path
end

And(/^I add new instructor$/) do
  visit "/create_instructor"
end 

When(/^I select the delete for the instructor$/) do
  @instructor = Instructor.find_by(name: "Hang Li")
  find(:xpath, "//a[@href='#{instructor_path(@instructor)}']", :text => "delete").click
end 