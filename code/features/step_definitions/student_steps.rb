Then(/^I start evaluation$/) do
  visit quiz_path
end

Then(/^I finish evaluation$/) do
  visit "/quiz_problem_answer"
end

Then(/^I select flashcards$/) do
  select "Flashcard", :from => "selected_quiz_type"
end

And(/^I check the answer$/) do
  visit "/quiz_flashcard_answer?nextid=0&thisid=0"
end