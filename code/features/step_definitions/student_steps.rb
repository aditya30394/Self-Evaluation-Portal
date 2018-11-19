When(/^QuestionType is Short Answer$/) do
  @problem = Problem.find_by(id: 3)
end
  
Then(/^I start evaluation$/) do
  visit quiz_path
end

Then(/^I finish evaluation after "([0-9]*)" questions$/) do |id|
  visit quiz_problem_answer_path(:tillid => id)
end

Then(/^I select flashcards$/) do
  select "Flashcard", :from => "selected_quiz_type"
end

And(/^I check the answer$/) do
  visit "/quiz_flashcard_answer?nextid=0&thisid=0"
end