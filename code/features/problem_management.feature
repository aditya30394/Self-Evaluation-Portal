Feature: question management by instructor
  
  In order to manage the problems
  As an instructor
  I want to be able to manage the problems
  
  Scenario: 'View Problems by Topics'
    When I log in with hanna's information
    Then I click View Problems
    Then I should see "All problems"
    And I should see "Data Structures and Algorithms"
    Then I click Data Structures and Algorithms
    Then I should see "Problems"
    
  Scenario: 'Add Problems by Topics'
    When I log in with hanna's information
    Then I click View Problems
    Then I should see "All problems"
    And I should see "Data Structures and Algorithms"
    Then I click Data Structures and Algorithms
    Then I should see "Create New Problem"
    When I click Create new problem under Data Structures and Algorithms
    Then I should see "Create Problem"
    When I select "Short Answer" from "problem_question_type_id"
    Then I fill in "Question" with "1"
    And I fill in "Add answer for short answer questions below" with "1"
    And I fill in "Remark" with "1"
    Then I press "Create Problem"
    Then I should see "Problem created."
    
  Scenario: 'Add Problems by Topics with null'
    When I log in with hanna's information
    Then I click View Problems
    Then I should see "All problems"
    And I should see "Data Structures and Algorithms"
    Then I click Data Structures and Algorithms
    Then I should see "Create New Problem"
    When I click Create new problem under Data Structures and Algorithms
    Then I should see "Create Problem"
    When I select "Short Answer" from "problem_question_type_id"
    Then I fill in "Question" with "1"
    And I fill in "Add answer for short answer questions below" with ""
    And I fill in "Remark" with "1"
    Then I press "Create Problem"
    Then I should see "Answer can't be blank"
    
  Scenario: 'Edit Problems by Topics'
    When I log in with hanna's information
    Then I click View Problems
    Then I should see "All problems"
    And I should see "Quick sort algorithm is an example of?"
    When I follow "Quick sort algorithm is an example of?"
    Then I follow "Edit Problem"
    Then I should see "Update Problem"
    When I select "Short Answer" from "problem_question_type_id"
    And I fill in "Add answer for short answer questions below" with "Divide and Conquer"
    Then I fill in "Remark" with "1"
    And I press "Save Changes"
    Then I should see "Problem updated"
    
  Scenario: 'Delete Problems by Topics'
    When I log in with hanna's information
    Then I click View Problems
    Then I should see "All problems"
    And I should see "Quick sort algorithm is an example of?"
    When I follow "Quick sort algorithm is an example of?"
    Then I should see "Delete Problem"
    Then I follow "Delete Problem"
    And I should see "Problem deleted."
    
  Scenario: 'Edit Problems by Topics with null'
    When I log in with hanna's information
    Then I click View Problems
    Then I should see "All problems"
    And I should see "Quick sort algorithm is an example of?"
    When I follow "Quick sort algorithm is an example of?"
    Then I follow "Edit Problem"
    Then I should see "Update Problem"
    When I select "Short Answer" from "problem_question_type_id"
    And I fill in "Add answer for short answer questions below" with ""
    Then I fill in "Remark" with "1"
    And I press "Save Changes"
    Then I should see "Answer can't be blank"

    
  

    
    
    
    

    