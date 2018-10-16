Feature: management by admin instructor
  
  In order to manage the instructors
  As an admin instructor
  I want to be able to manage all other instructors
  
  Scenario: 'Delete an instructor'
    When I go check the log in page
    Then I should see "Log in"
    And I fill in "Email" with "admin@admin.com"
    And I fill in "Password" with "123456"
    Then I press "Log in"
    Then I should see "admin@admin.com"
    When I am on the instructors page
    Then I should see "Hang Li"
    And I should see "delete"
    When I select the delete for the instructor
    Then I should not see "Hang Li"
    And I should see "Instructor deleted"
    
  Scenario: 'Create an instructor'
    When I go check the log in page
    Then I should see "Log in"
    And I fill in "Email" with "admin@admin.com"
    And I fill in "Password" with "123456"
    Then I press "Log in"
    Then I should see "admin@admin.com"
    When I am on the instructors page
    Then I should see "Add New Instructor"
    And I add new instructor
    Then I fill in "Name" with "Sweet"
    And I fill in "Email" with "sweet@tamu.edu"
    Then I press "Add New Instructor"
    Then I should see "Create new instructor successfully."

    
    
    
    

    