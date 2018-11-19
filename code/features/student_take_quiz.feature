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

#For evaluating the short answer questions  
  Scenario: 'Start Evaluation'
    When I am on the homepage
    Then I should see "Start Evaluation!"
    And I start evaluation
    Then I should see "Select Topics"
    And I press "Select Topics"
    Then I should see "Previous Problem"
    And I should see "Next Problem"
    When I follow "Next Problem"
    And I follow "Next Problem"
    And I fill in "student_answer" with "Stack"
    And I press "Save Your Answer"
    Then I finish evaluation after "3" questions
    Then I should see "Total 1/3"
    And I should see "Your Answer: "
    And I should see "Next Problem"
    And I should not see "Previous Problem"
    Then I follow "Next Problem"
    And I should see "Your Answer: "
    And I should see "Next Problem"
    And I should see "Previous Problem"
    Then I follow "Next Problem"
    And I should see "Your Answer: Stack"
    And I should not see "Next Problem"
    And I should see "Quit Evaluation"
   
#Short answer question with wrong answer, verify the score report 
  Scenario: 'Start Evaluation'
    When I am on the homepage
    Then I should see "Start Evaluation!"
    And I start evaluation
    Then I should see "Select Topics"
    And I press "Select Topics"
    Then I should see "Previous Problem"
    And I should see "Next Problem"
    When I follow "Next Problem"
    And I follow "Next Problem"
    And I fill in "student_answer" with "Queue"
    And I press "Save Your Answer"
    Then I finish evaluation after "3" questions
    Then I should see "Total 0/3"
    
#Short answer question with case of the answer changed, should still work, verify based on the score report
  Scenario: 'Start Evaluation'
    When I am on the homepage
    Then I should see "Start Evaluation!"
    And I start evaluation
    Then I should see "Select Topics"
    And I press "Select Topics"
    Then I should see "Previous Problem"
    And I should see "Next Problem"
    When I follow "Next Problem"
    And I follow "Next Problem"
    And I fill in "student_answer" with "stack"
    And I press "Save Your Answer"
    Then I finish evaluation after "3" questions
    Then I should see "Total 1/3"
 #short answer evaluation with blank answer, verify using the score report
  Scenario: 'Start Evaluation'
    When I am on the homepage
    Then I should see "Start Evaluation!"
    And I start evaluation
    Then I should see "Select Topics"
    And I press "Select Topics"
    Then I should see "Previous Problem"
    And I should see "Next Problem"
    When I follow "Next Problem"
    And I follow "Next Problem"
    And I fill in "student_answer" with ""
    And I press "Save Your Answer"
    Then I finish evaluation after "3" questions
    Then I should see "Total 0/3"
    
  
