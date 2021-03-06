require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))


module WithinHelpers
  def with_scope(locator)
    locator ? within(*selector_for(locator)) { yield } : yield
  end
end
World(WithinHelpers)


When /^I click "Tenant Information"$/ do
   find("#2").click
end

When /^I click "Logout"$/ do
   find("#13").click
end

When /^I click "Delete"$/ do
   find("#15", match: :prefer_exact).click
end

When /^I click "New User"$/ do
   find("#6").click
end

When /^I click "Repair Notification"$/ do
   find("#3").click
end

When /^I click "Repair Notification admin"$/ do
   find("#5").click
end

When /^I click "Rental"$/ do
   find("#1").click
end

When /^I click "adminRental"$/ do
   find("#8" , match: :prefer_exact).click
end

When /^I click "Member Information"$/ do
   find("#4").click
end

When /^I click "Edit"$/ do
   find("#16" ,match: :prefer_exact).click
end





Given(/^I am on the login$/) do
  visit path_to('login page')
end

Given(/^I am on the signup$/) do
  visit path_to('signup page')
end

Given(/^I am on the member$/) do
  visit path_to('member page')
end

Given(/^I am on the admin$/) do
  visit path_to('admin page')
end



Given /I am on the (.+)$ / do |page_name|
  visit path_to(page_name)
end

Given /the following user exist/ do |user_table|
    user_table.hashes.each do |a|
      User.create!(a)
    end
end

Given /the following rental exist/ do |user_table|
    user_table.hashes.each do |a|
      Rental.create!(a)
    end
end

Given /the following repair exist/ do |user_table|
    user_table.hashes.each do |a|
      Repair.create!(a)
    end
end


When /^I go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^I press "([^\"]*)"$/ do |button|
  click_on(button)
end



#When /^I click "([^\"]*)"$/ do |link|
#  click_on(link, match: :first)
#end


Given /^I leave the "([^\"]*)"$/  do |field|
  fill_in(field.gsub(' ', '_'), :with => "")
end  

When /^I fill in "([^\"]*)" with "([^\"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^I fill in "([^\"]*)" for "([^\"]*)"$/ do |value, field|
  fill_in(field.gsub(' ', '_'), :with => value)
end

When /^I fill in the following:$/ do |fields|
  fields.rows_hash.each do |name, value|
    When %{I fill in "#{name}" with "#{value}"}
  end
end

When /^I select "([^\"]*)" from "([^\"]*)"$/ do |value, field|
  select(value, :from => field)
end

When /^I check "([^\"]*)"$/ do |field|
  check(field)
end

When /^I uncheck "([^\"]*)"$/ do |field|
  uncheck(field)
end

When /^I choose "([^\"]*)"$/ do |field|
  choose(field)
end

Then /^I should see "([^\"]*)"$/ do |text|
  page.should have_content(text)
end

Then /^I should see \/([^\/]*)\/$/ do |regexp|
  regexp = Regexp.new(regexp)
  page.should have_content(regexp)
end

Then /^I should not see "([^\"]*)"$/ do |text|
  page.should_not have_content(text)
end

Then /^I should not see \/([^\/]*)\/$/ do |regexp|
  regexp = Regexp.new(regexp)
  page.should_not have_content(regexp)
end

Then /^the "([^\"]*)" field should contain "([^\"]*)"$/ do |field, value|
  find_field(field).value.should =~ /#{value}/
end

Then /^the "([^\"]*)" field should not contain "([^\"]*)"$/ do |field, value|
  find_field(field).value.should_not =~ /#{value}/
end

Then /^the "([^\"]*)" checkbox should be checked$/ do |label|
  find_field(label).should be_checked
end

Then /^the "([^\"]*)" checkbox should not be checked$/ do |label|
  find_field(label).should_not be_checked
end

Then /^I should be on (.+)$/ do |page_name|
  current_path.should == path_to(page_name)
end

Then /^page should have (.+) message "([^\"]*)"$/ do |type, text|
  page.has_css?("p.#{type}", :text => text, :visible => true)
end