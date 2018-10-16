Feature: topic management by instructor
  
  In order to manage the prlb
  As an instructor
  I want to be able to manage the topics
  
  Scenario: 'View Topics'
    When I log in with hanna's information
    Then I click View Topics
    Then I should see "All topics"
    
  Scenario: 'Create A New Topic'
    When I log in with hanna's information
    Then I click View Topics 
    Then I should see "Create New Topic"
    When I click Create new topic
    Then I should see "Create Topic"
    And I fill in "Name" with "Tree-based Ensembles"
    And I press "Create Topic"
    Then I should see "Create topic successfully."
    
  Scenario: 'Create A New Topic with null'
    When I log in with hanna's information
    Then I click View Topics 
    Then I should see "Create New Topic"
    When I click Create new topic
    Then I should see "Create Topic"
    And I fill in "Name" with ""
    And I press "Create Topic"
    Then I should see "Name can't be blank"
    
  Scenario: 'Edit Topic Name'
    When I log in with hanna's information
    Then I click View Topics
    Then I should see "Data Structures and Algorithms"
    And I should see "Edit"
    Then I click edit of Data Structures and Algorithms
    Then I should see "Update topic"
    When I fill in "Name" with "Data Structures and Algorithms - 1"
    Then I press "Save changes"
    Then I should see "Topic updated"
    
  Scenario: 'Edit Topic Name to null'
    When I log in with hanna's information
    Then I click View Topics
    Then I should see "Data Structures and Algorithms"
    And I should see "Edit"
    Then I click edit of Data Structures and Algorithms
    Then I should see "Update topic"
    When I fill in "Name" with ""
    Then I press "Save changes"
    Then I should see "Name can't be blank"
    
  Scenario: 'Delete Topic'
    When I log in with hanna's information
    Then I click View Topics
    Then I should see "Data Structures and Algorithms"
    And I should see "Delete"
    Then I click delete of Data Structures and Algorithms
    Then I should not see "Data Structures and Algorithms"
    
    
    

    

    