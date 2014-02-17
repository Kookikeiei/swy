Feature: Log in to the Apartment Application

  	As a tenant.
    So that I can log in to my user system.
	  I can see my rental information.
    I want to log in to the system.

	  As a admin.
    So that I can log in and manage about admin system.
    I want to log in to the system.


      Background:
      Given the following user exists:
|username|password |name   |surname|age|birth_date|personal_id|address|email     |rent|room_no|  
|admin2  |123456789|Pigdome|pd     |22 |20/10/91  |11111111111|b6     |pd@hot.com|20  |s01    |
|kham    |5678000  |khamsai|ks     |21 |06/01/92  |22222222222|b6     |ks@hot.com|30  |s01    |


 Scenario: Log in successful
        Given I am on the login 
        And I fill in "username" with "kham"
        And I fill in "password" with "5678000"
        When I press "Login"
        Then I should be on system page

 Scenario: Log in unsuccessful
        Given I am on the login 
        And I fill in "username" with "xxx"
        And I fill in "password" with "xxx"
        When I press "Login"
        Then I should be on login page 

 Scenario: Admin log in 
        Given I am on the login 
        And I fill in "username" with "admin"
        And I fill in "password" with "123456789"
        When I press "Login"
        Then I should be on admin page
