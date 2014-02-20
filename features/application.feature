Feature : Show the application function

  	As a tenant.
        So that I can link to the function that I want to use.
        I want to link into the function I want to use.

Background:
      Given the following user exists:
|username|password |name   |surname|age|birth_date|personal_id|address|email     |rent|room_no|  
|admin2   |123456789|Pigdome|pd     |22 |20/10/91  |11111111111|b6     |pd@hot.com|20  |s01    |
|kham    |5678000  |khamsai|ks     |21 |06/01/92  |22222222222|b6     |ks@hot.com|30  |s01    |

 Scenario: Log in successful
        Given I am on the login 
        And I fill in "username" with "kham"
        And I fill in "password" with "5678000"
        When I press "rental"
        Then I should be on system rental page 
	      When I press "repair"
        Then I should be on system repair page
	      When I press "payment"
        Then I should be on system payment page 
 
	

