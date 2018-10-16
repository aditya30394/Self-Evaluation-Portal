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
    Then I fill in "Question" with "1"
    And I fill in "Answer" with "1"
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
    Then I fill in "Question" with "1"
    And I fill in "Answer" with ""
    And I fill in "Remark" with "1"
    Then I press "Create Problem"
    Then I should see "Answer can't be blank"
    
  Scenario: 'Edit Problems by Topics'
    When I log in with hanna's information
    Then I click View Problems
    Then I should see "All problems"
    And I should see "Quick sort algorithm is an example of? A. Greedy approach B. Improved binary search C. Dynamic programming D. Divide and conquer"
    When I edit Quick sort algorithm is an example of? A. Greedy approach B. Improved binary search C. Dynamic programming D. Divide and conquer
    Then I should see "Update Problem"
    Then I fill in "Remark" with "1"
    And I press "Save Changes"
    Then I should see "Problem updated"
    
  Scenario: 'Delete Problems by Topics'
    When I log in with hanna's information
    Then I click View Problems
    Then I should see "All problems"
    And I should see "Quick sort algorithm is an example of? A. Greedy approach B. Improved binary search C. Dynamic programming D. Divide and conquer"
    When I check Quick sort algorithm is an example of? A. Greedy approach B. Improved binary search C. Dynamic programming D. Divide and conquer
    Then I should see "Delete Problem"
    Then I delete Quick sort algorithm is an example of?
    And I should see "Problem deleted."
    
  Scenario: 'Edit Problems by Topics with null'
    When I log in with hanna's information
    Then I click View Problems
    Then I should see "All problems"
    And I should see "Quick sort algorithm is an example of? A. Greedy approach B. Improved binary search C. Dynamic programming D. Divide and conquer"
    When I edit Quick sort algorithm is an example of? A. Greedy approach B. Improved binary search C. Dynamic programming D. Divide and conquer
    Then I should see "Update Problem"
    Then I fill in "Answer" with ""
    And I press "Save Changes"
    Then I should see "Answer can't be blank"

    
  

    
    
    
    

    