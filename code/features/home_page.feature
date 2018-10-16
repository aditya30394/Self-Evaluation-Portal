Feature: home page viewed by students and instructors
  
  In order to use the website
  As an instructor or a student
  I want to be able to click around the website 
  
  Scenario: 'Home Page View'
    When I am on the home page 
    Then I should see "Home"
    And I should see "Help"
    And I should see "About"
    And I should see "Contact"