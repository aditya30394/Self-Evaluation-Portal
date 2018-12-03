Feature: quiz taken by student
  
  In order to use the website
  As a student
  I want to be able to take the quiz

#Evaluating correct MCQ answer case  
  Scenario: 'Evaluating correct answer'
    When I am on the homepage 
    Then I should see "Start Evaluation!"
    And I start evaluation
    Then I should see "Select Topics"
    And I press "Select Topics"
    Then I should see "<"
    And I should see ">"
    Then I check "Divide and conquer"
    And I press "Save Your Answer"
    Then I finish evaluation after "1" questions
    Then I should see "Total 1/1"
    And I should see "Your Answer: Divide and conquer"
    And I should see "Answer: Divide and conquer"
    And I should not see "<"
    And I should not see ">"

#Evaluating wrong MCQ answer case  
  Scenario: 'Evaluating wrong MCQ answer'
    When I am on the homepage 
    Then I should see "Start Evaluation!"
    And I start evaluation
    Then I should see "Select Topics"
    And I press "Select Topics"
    Then I should see "<"
    And I should see ">"
    Then I check "Greedy approach"
    And I press "Save Your Answer"
    Then I finish evaluation after "1" questions
    Then I should see "Total 0/1"
    And I should see "Your Answer: Greedy approach"
    And I should see "Answer: Divide and conquer"
    And I should not see "<"
    And I should not see ">"

#Evaluating NO/Blank MCQ answer case  
  Scenario: 'Evaluating NO/Blank MCQ answer'
    When I am on the homepage 
    Then I should see "Start Evaluation!"
    And I start evaluation
    Then I should see "Select Topics"
    And I press "Select Topics"
    Then I should see "<"
    And I should see ">"
    Then I finish evaluation after "1" questions
    Then I should see "Total 0/1"
    And I should see "Your Answer: "
    And I should see "Answer: Divide and conquer"
    And I should not see "<"
    And I should not see ">"    

#For evaluating the short answer questions  
  Scenario: 'Start Evaluation'
    When I am on the homepage
    Then I should see "Start Evaluation!"
    And I start evaluation
    Then I should see "Select Topics"
    And I press "Select Topics"
    Then I should see "<"
    And I should see ">"
    When I follow ">"
    And I follow ">"
    And I fill in "student_answer" with "Stack"
    And I press "Save Your Answer"
    Then I finish evaluation after "3" questions
    Then I should see "Total 1/3"
    And I should see "Your Answer: "
    And I should see ">"
    And I should not see "<"
    Then I follow ">"
    And I should see "Your Answer: "
    And I should see ">"
    And I should see "<"
    Then I follow ">"
    And I should see "Your Answer: Stack"
    And I should not see ">"
    And I should see "Quit Evaluation"
   
#Short answer question with wrong answer, verify the score report 
  Scenario: 'Start Evaluation'
    When I am on the homepage
    Then I should see "Start Evaluation!"
    And I start evaluation
    Then I should see "Select Topics"
    And I press "Select Topics"
    Then I should see "<"
    And I should see ">"
    When I follow ">"
    And I follow ">"
    And I fill in "student_answer" with "Queue"
    And I press "Save Your Answer"
    Then I finish evaluation after "3" questions
    Then I should see "Total 0/3"
    
#Short answer question with case of the answer changed, should still work, verify based on the score report
  Scenario: 'Short answer question with case of the answer changed'
    When I am on the homepage
    Then I should see "Start Evaluation!"
    And I start evaluation
    Then I should see "Select Topics"
    And I press "Select Topics"
    Then I should see "<"
    And I should see ">"
    When I follow ">"
    And I follow ">"
    And I fill in "student_answer" with "stack"
    And I press "Save Your Answer"
    Then I finish evaluation after "3" questions
    Then I should see "Total 1/3"
 
 #short answer evaluation with blank answer, verify using the score report
  Scenario: 'Short answer evaluation with blank answer'
    When I am on the homepage
    Then I should see "Start Evaluation!"
    And I start evaluation
    Then I should see "Select Topics"
    And I press "Select Topics"
    Then I should see "<"
    And I should see ">"
    When I follow ">"
    And I follow ">"
    And I fill in "student_answer" with ""
    And I press "Save Your Answer"
    Then I finish evaluation after "3" questions
    Then I should see "Total 0/3"
    
  
