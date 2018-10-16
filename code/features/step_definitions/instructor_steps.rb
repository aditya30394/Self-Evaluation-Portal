Then(/^I click Settings$/) do
  @instructor = Instructor.find_by(name: "Hanna")
  visit edit_instructor_path(@instructor)
end

Then(/^I click View Topics$/) do
  visit topics_path
end

Then(/^I click View Problems/) do
  visit problems_path
end

Then(/^I click Create new topic$/) do
  visit new_topic_path 
end

When(/^I am not log in$/) do
  session.delete(:instructor_id)
end

When(/^I click edit of Data Structures and Algorithms$/) do
  @topic = Topic.find_by(name: "Data Structures and Algorithms")
  find(:xpath, "//a[@href='#{edit_topic_path(@topic)}']", :text => "Edit").click
end 

When(/^I click delete of Data Structures and Algorithms$/) do
  @topic = Topic.find_by(name: "Data Structures and Algorithms")
  find(:xpath, "//a[@href='#{topics_path(@topic).sub! '.', '/'}']", :text => "Delete").click
end 

Then(/^I click Data Structures and Algorithms$/) do
  @topic = Topic.find_by(name: "Data Structures and Algorithms")
  find(:xpath, "//a[@href='#{topics_path(@topic).sub! '.', '/'}']", :text => "Data Structures and Algorithms", :match => :first).click
end

When(/^I click Create new problem under Data Structures and Algorithms$/) do
  @topic = Topic.find_by(name: "Data Structures and Algorithms")
  visit new_problem_path(:topic_from => @topic.id)
end

When("I edit Quick sort algorithm is an example of? A. Greedy approach B. Improved binary search C. Dynamic programming D. Divide and conquer") do
  @problem = Problem.find_by(id: 1)
  visit edit_problem_path(@problem)
end

When("I check Quick sort algorithm is an example of? A. Greedy approach B. Improved binary search C. Dynamic programming D. Divide and conquer") do
  visit "/problems/1"
end

Then("I delete Quick sort algorithm is an example of?") do
  @problem = Problem.find_by(id: 1)
  find(:xpath, "//a[@href='#{problems_path(@problem).sub! '.', '/'}']", :text => "Delete").click
end







