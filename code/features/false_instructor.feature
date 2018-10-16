Feature: security check by false instructor
  
  In order to add security
  As a student
  I should not be able to manage the website
  
  Scenario: 'Try Manage Topics Without Login'
    When I click Create new topic
    Then I should see "Please log in."
    
  Scenario: 'Try Manage Questions Without Login'
    When I click Create new problem under Data Structures and Algorithms
    Then I should see "Please log in."