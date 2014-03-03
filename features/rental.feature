Feature: Show a rental from Apartment

   As a tenant.

   So that I can see my rental.

   I want to know the rental.


Background:
 Given the following user exists:
|username|password |name   |surname|age|birth_date|personal_id|address|email     |rent|room_no|phone   |
|admin   |123456789|Pigdome|pd     |22 |20/10/91  |11111111111|b6     |pd@hot.com|20  |s01    |08111111|
|kham    |5678000  |khamsai|ks     |21 |06/01/92  |22222222222|b6     |ks@hot.com|30  |s01    |127344  |

 Given the following rental exists:
|room_no |rent  |name   |elec_unit |water_unit |unpay |
|s01     |20    |Pigdome|50        | 20        |11    |
|s01     |50    |khamsai|99        | 21        |92    |

 Scenario: user see rental
        Given I am on the login 
        And I fill in "username" with "kham"
        And I fill in "password" with "5678000"
        When I press "Login"
        Then I should be on system page
        And I click "Rental"
        Then I should see "Room no"
        Then I should see "Rent"
        Then I should see "Elec unit"
        Then I should see "Water unit"
        Then I should see "Unpay"

Scenario: admin can see member information
        Given I am on the login 
        And I fill in "username" with "admin"
        And I fill in "password" with "123456789"
        When I press "Login"
        Then I should be on admin page
        And I click "Member Information"
        Then I should be on member page
        And I click "Rental"
        Then I should see "Room no"
        Then I should see "Rent"
        Then I should see "Elec unit"
        Then I should see "Water unit"
        Then I should see "Unpay"
        Then I should see "Edit"