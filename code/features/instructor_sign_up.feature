Feature: sign up by instructor
  
  In order to manage the website
  As an instructor
  I want to be able to sign up
  
  Scenario: 'Standard Instructor Log in with out registration'
    When I am on the signup page 
    Then I should see "Sign up"
    When I go check the log in page
    Then I should see "Log in"
    And I fill in "Email" with "smith@tamu.edu"
    And I fill in "Password" with "123456"
    Then I press "Log in"
    Then I should see "Account not activated. Please sign up first."
  
  Scenario: 'Standard Instructor Registration Success'
    When I am on the signup page 
    Then I should see "Sign up"
    And I fill in "Name" with "Smith"
    And I fill in "Email" with "smith@tamu.edu"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I press "Create My Account"
    Then I should see "Account Activated."
  
  Scenario: 'Standard Instructor Log in failed'
    When I am on the signup page 
    Then I should see "Sign up"
    When I go check the log in page
    Then I should see "Log in"
    And I fill in "Email" with "hanna@tamu.edu"
    And I fill in "Password" with "12345621"
    Then I press "Log in"
    Then I should see "Invalid email/password combination."
    
  Scenario: 'Standard Instructor Registration Repeated'
    When I am on the signup page 
    Then I should see "Sign up"
    And I fill in "Name" with "Hanna"
    And I fill in "Email" with "hanna@tamu.edu"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I press "Create My Account"
    Then I should see "You have already signed up."
    
  Scenario: 'Fake Instructor Registration'
    When I am on the signup page 
    Then I should see "Sign up"
    And I fill in "Name" with "Smith"
    And I fill in "Email" with "smith@gmail.edu"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I press "Create My Account"
    Then I should see "Not eligible for signing up"
  
  Scenario: 'Standard Instructor Registration Fail - Name'
    When I am on the signup page 
    Then I should see "Sign up"
    And I fill in "Name" with ""
    And I fill in "Email" with "hanna@gmail.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I press "Create My Account"
    Then I should see "Not eligible for signing up"

  Scenario: 'Standard Instructor Registration Fail - Email'
    When I am on the signup page 
    Then I should see "Sign up"
    And I fill in "Name" with "Hanna"
    And I fill in "Email" with "hanna"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I press "Create My Account"
    Then I am on the signup page 
    
  Scenario: 'Standard Instructor Registration Fail - Password'
    When I am on the signup page 
    Then I should see "Sign up"
    And I fill in "Name" with "Hanna"
    And I fill in "Email" with "hanna@gmail.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password1"
    And I press "Create My Account"
    Then I should see "Not eligible for signing up."

    