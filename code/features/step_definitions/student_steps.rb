Then(/^I start evaluation$/) do
  visit quiz_path
end

Then(/^I finish evaluation after "([0-9]*)" questions$/) do |id|
  tillid = id.to_i - 1
  visit quiz_problem_answer_path(:tillid => tillid)
end

Then(/^I select flashcards$/) do
  select "Flashcard", :from => "selected_quiz_type"
end

