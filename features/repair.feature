Feature: Add a repair notification

   As a tenant.

   So that I can request about repair notification.

   I want to add the repair notification.


Background:
 Given the following user exists:
|username|password |name   |surname|age|birth_date|personal_id|address|email     |rent|room_no|phone   |
|admin   |123456789|Pigdome|pd     |22 |20/10/91  |11111111111|b6     |pd@hot.com|20  |s01    |08111111|
|kham    |5678000  |khamsai|ks     |21 |06/01/92  |22222222222|b6     |ks@hot.com|30  |s01    |127344  |

 Given the following repair exists:
|room_no |name   |problem    |
|s01     |Pigdome| brabra    |     
|s01     |kham   | qwerty    |        

 Scenario: user can add repair problem
        Given I am on the login 
        And I fill in "username" with "kham"
        And I fill in "password" with "5678000"
        When I press "Login"
        Then I should be on system page
        And I click "Repair Notification"
        Then I should be on repair page
        And I fill in "Problem" with "qwerty"
        And I press "Post Problem"
        Then I should see "qwerty"

Scenario: admin can see repair information
        Given I am on the login 
        And I fill in "username" with "admin"
        And I fill in "password" with "123456789"
        When I press "Login"
        Then I should be on admin page
        And I click "Repair Notification admin"
        Then I should be on adrep page
        Then I should see "Room No"
        Then I should see "Problem"
        Then I should see "Name"

Scenario: admin can delete repair information
        Given I am on the login 
        And I fill in "username" with "admin"
        And I fill in "password" with "123456789"
        When I press "Login"
        Then I should be on admin page
        And I click "Repair Notification admin"
        Then I should be on adrep page
        And I click "Delete"      
        Then I should be on adrep page