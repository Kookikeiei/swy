Feature: Sign up to the Apartment Application

  	As a tenant.
    So that I can sign up for user system.
    I want to register for login.

    Background:
      Given the following user exists:
|username|password |name   |surname|age|birth_date|personal_id|address|email     |rent|room_no|phone   |
|admin   |123456789|Pigdome|pd     |22 |20/10/91  |11111111111|b6     |pd@hot.com|20  |s01    |08111111|
|kham    |5678000  |khamsai|ks     |21 |06/01/92  |22222222222|b6     |ks@hot.com|30  |s01    |127344  |

Scenario: sing up Successful
  Given I am on the login 
  And I fill in "username" with "admin"
  And I fill in "password" with "123456789"
  When I press "Login"
  Then I should be on admin page
  And I press "New User"
  Then I should be on signup page
  And I fill in "Name" with "apirak"
  And I fill in "Surname" with "chockdee"
  And I fill in "Age" with "22"
  And I fill in "Birth date" with "20/10/34"
  And I fill in "Personal" with "888888888888"
  And I fill in "Address" with "abc defg 555" 
  And I fill in "Phone" with "08979555" 
  And I fill in "Email" with "pigdome@hotmail.com"
  And I fill in "Rent" with "20"
  And I fill in "Room no" with "0"
  And I fill in "Username" with "khamsaiii"
  And I fill in "Password" with "555555"
  When I click "Save"
  Then I should see "User was successfully created."
    

Scenario: sign up with blank field and invalid field
  Given I am on the login 
  And I fill in "username" with "admin"
  And I fill in "password" with "123456789"
  When I press "Login"
  Then I should be on admin page
  And I press "New User"
  Then I should be on signup page
  And I fill in "Name" with ""
  And I fill in "Surname" with "chockdee"
  And I fill in "Age" with " "
  And I fill in "Birth date" with "20/10/34"
  And I fill in "Personal" with "888888888888"
  And I fill in "Address" with "abc defg 555" 
  And I fill in "Email" with "-0-@google.net"
  And I fill in "Rent" with "20"
  And I fill in "Room no" with "0"
  And I fill in "Username" with "ks"
  And I fill in "Password" with "55"
  When I click "Save"
  Then I should see "Name can't be blank"
  Then I should see "Age can't be blank"
  Then I should see "Password is too short (minimum is 6 characters)"  
  Then I should see "Username is too short (minimum is 3 characters)"                  
  
    
   