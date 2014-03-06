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
|room_no |rent  |name   |text       |seen_fix |
|s01     |20    |Pigdome| brabra    |         |
|s01     |50    |khamsai| qwerty    |         |

 Scenario: user can add repair problem
        Given I am on the login 
        And I fill in "username" with "kham"
        And I fill in "password" with "5678000"
        When I press "Login"
        Then I should be on system page
        And I click "Repair Notification"
        Then I should be on repair page
        And I click "Post problem"
        Then I should see "Successful post"

Scenario: admin can see repair information
        Given I am on the login 
        And I fill in "username" with "admin"
        And I fill in "password" with "123456789"
        When I press "Login"
        Then I should be on admin page
        And I click "Repair Notification"
        Then I should be on manage repair page
        Then I should see "Room No"
        Then I should see "Rent"
        Then I should see "Problem"
        Then I should see "Name"
        Then I should see "Seen and Fixing"
        Then I should see "Remove Notification"