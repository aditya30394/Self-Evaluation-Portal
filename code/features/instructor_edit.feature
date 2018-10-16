Feature: edit profile by instructor
  
  In order to update my profile
  As an instructor
  I want to be able to edit my profile
  
  Scenario: 'Update profile'
    When I log in with hanna's information
    Then I click Settings
    Then I should see "Update your profile"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I press "Save Changes"
    Then I should see "Profile updated"
    
  

    
