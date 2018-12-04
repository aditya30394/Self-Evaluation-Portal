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
  
  #For a MCQ question 
  #Options filled and correct answer
  Scenario: 'Add Problems by Topics for MCQ with options filled and answer checked'
    When I log in with hanna's information
    Then I click View Problems
    Then I should see "All problems"
    And I should see "Data Structures and Algorithms"
    Then I click Data Structures and Algorithms
    Then I should see "Create New Problem"
    When I click Create new problem under Data Structures and Algorithms
    Then I should see "Create Problem"
    When I select "MCQ" from "problem_question_type_id"
    Then I fill in "Question" with "1"
    And I fill in "Option 1" with "1"
    And I fill in "Option 2" with "2"
    And I fill in "Option 3" with "3"
    And I fill in "Option 4" with "4"
    And I check "Option 1"
    And I fill in "Remark" with "1"
    And I fill in "Link" with "https://wikipedia.org"
    Then I press "Create Problem"
    Then I should see "Problem created."
  
  Scenario: 'Add Problems by Topics for MCQ with options filled, but correct answer not filled'
    When I log in with hanna's information
    Then I click View Problems
    Then I should see "All problems"
    And I should see "Data Structures and Algorithms"
    Then I click Data Structures and Algorithms
    Then I should see "Create New Problem"
    When I click Create new problem under Data Structures and Algorithms
    Then I should see "Create Problem"
    When I select "MCQ" from "problem_question_type_id"
    Then I fill in "Question" with "1"
    And I fill in "Option 1" with "1"
    And I fill in "Option 2" with "2"
    And I fill in "Option 3" with "3"
    And I fill in "Option 4" with "4"
    And I fill in "Remark" with "1"
    Then I press "Create Problem"
    Then I should see "Provide answers and correct choices for MCQ."

  Scenario: 'Add Problems by Topics for MCQ with no options and correct choices filled'
    When I log in with hanna's information
    Then I click View Problems
    Then I should see "All problems"
    And I should see "Data Structures and Algorithms"
    Then I click Data Structures and Algorithms
    Then I should see "Create New Problem"
    When I click Create new problem under Data Structures and Algorithms
    Then I should see "Create Problem"
    When I select "MCQ" from "problem_question_type_id"
    Then I fill in "Question" with "1"
    And I fill in "Remark" with "1"
    Then I press "Create Problem"
    Then I should see "Provide answers and correct choices for MCQ." 
  
  Scenario: 'Add Problems by Topics for MCQ with not all options filled'
    When I log in with hanna's information
    Then I click View Problems
    Then I should see "All problems"
    And I should see "Data Structures and Algorithms"
    Then I click Data Structures and Algorithms
    Then I should see "Create New Problem"
    When I click Create new problem under Data Structures and Algorithms
    Then I should see "Create Problem"
    When I select "MCQ" from "problem_question_type_id"
    Then I fill in "Question" with "1"
    Then I fill in "Option 1" with "1"
    Then I fill in "Option 2" with "1"
    And I check "Option 2"
    And I fill in "Remark" with "1"
    Then I press "Create Problem"
    Then I should see "Options not saved properly."
    
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
    
  Scenario: 'Edit Problems by Topics for Short Answer'
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
  
  Scenario: 'Edit Problems by Topics for type MCQ'
    When I log in with hanna's information
    Then I click View Problems
    Then I should see "All problems"
    And I should see "Quick sort algorithm is an example of?"
    When I follow "Quick sort algorithm is an example of?"
    Then I follow "Edit Problem"
    Then I should see "Update Problem"
    When I select "MCQ" from "problem_question_type_id"
    And I fill in "Option 2" with "Binary Search"
    Then I fill in "Remark" with "1"
    And I press "Save Changes"
    Then I should see "Problem updated"
    
  Scenario: 'Edit Problems by Topics for type MCQ with correct answer left blank'
    When I log in with hanna's information
    Then I click View Problems
    Then I should see "All problems"
    And I should see "Quick sort algorithm is an example of?"
    When I follow "Quick sort algorithm is an example of?"
    Then I follow "Edit Problem"
    Then I should see "Update Problem"
    When I select "MCQ" from "problem_question_type_id"
    And I uncheck "Option 4"
    Then I fill in "Remark" with "1"
    And I press "Save Changes"
    Then I should see "Provide answers and correct choices for MCQ."
    
  Scenario: 'Edit Problems by Topics for type MCQ with Options made blank'
    When I log in with hanna's information
    Then I click View Problems
    Then I should see "All problems"
    And I should see "Quick sort algorithm is an example of?"
    When I follow "Quick sort algorithm is an example of?"
    Then I follow "Edit Problem"
    Then I should see "Update Problem"
    When I select "MCQ" from "problem_question_type_id"
    And I fill in "Option 1" with ""
    And I fill in "Option 2" with ""
    And I fill in "Option 3" with ""
    And I fill in "Option 4" with ""
    Then I fill in "Remark" with "1"
    And I press "Save Changes"
    Then I should see "Options not saved properly."
    
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

    
  

    
    
    
    

    