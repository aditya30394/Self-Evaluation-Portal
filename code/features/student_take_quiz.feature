Feature: quiz taken by student
  
  In order to use the website
  As a student
  I want to be able to take the quiz
  
  Scenario: 'Start Evaluation'
    When I am on the homepage 
    Then I should see "Start Evaluation!"
    And I start evaluation
    Then I should see "Select Topics"
    And I press "Select Topics"
    Then I should see "Previous Problem"
    And I should see "Next Problem"
    Then I fill in "student_answer" with "A"
    And I press "Save Your Answer"
    Then I finish evaluation
    
    
  