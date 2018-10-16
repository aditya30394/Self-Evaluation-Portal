Feature: quiz taken by student
  
  In order to use the website
  As a student
  I want to be able to take the quiz
  
  Scenario: 'Start Evaluation'
    When I am on the homepage 
    Then I should see "Start Evaluation!"
    And I start evaluation
    Then I should see "Select Topics"
    Then I select flashcards
    And I press "Select Topics"
    Then I should see "Show Answer"
    And I check the answer
    Then I should see "Answer"
    
  