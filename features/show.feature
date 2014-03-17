Feature: Show the application function

  	As a tenant.
        So that I can link to the function that I want to use.
        I want to link into the function I want to use.

 Background:
 Given the following user exists:
|username|password |name   |surname|age|birth_date|personal_id|address|email     |rent|room_no|phone   |
|admin   |123456789|Pigdome|pd     |22 |20/10/91  |11111111111|b6     |pd@hot.com|20  |s01    |08111111|
|kham    |5678000  |khamsai|ks     |21 |06/01/92  |22222222222|b6     |ks@hot.com|30  |s01    |127344  |

 Scenario: user see Tenant
        Given I am on the login 
        And I fill in "username" with "kham"
        And I fill in "password" with "5678000"
        When I press "Login"
        Then I should be on system page
        And I click img "Tenant Information"
        Then I should see "Tenant Information"

Scenario: admin can see member information
        Given I am on the login 
        And I fill in "username" with "admin"
        And I fill in "password" with "123456789"
        When I press "Login"
        Then I should be on admin page
        And I click "Member Information"
        Then I should be on member page