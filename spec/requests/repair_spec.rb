require 'spec_helper'
require 'simplecov'
SimpleCov.start 'rails'

describe 'Repair' do
  before { visit root_path }
  subject { page }

  describe 'user can add repair problem' do
     user = FactoryGirl.create(:user)
   before do
      fill_in :username, with: user.username
      fill_in :password, with: user.password
      click_on 'Login'
    end
      it { should have_link find('#1').click }
      it { should have_link find('#2').click }
      it { should have_link find('#3').click }
   
  end

  describe 'user can add repair problem' do
      user = FactoryGirl.create(:user)
   before do
      fill_in :username, with: user.username
      fill_in :password, with: user.password
      click_on 'Login'
      find('#3').click  
      fill_in :Problem, with: 'The bathroom has problem'
      click_on 'Post Problem'
    end
      it { should have_content("The bathroom has problem") }
      
   
  end


  describe "admin can manage rental" do
     FactoryGirl.create(:admin)
     p = FactoryGirl.create(:repair)
     #repair = FactoryGirl.create(:repair)
      before do
      fill_in :username, with: 'admin'
      fill_in :password, with: '123456789'
      click_on 'Login'
      find('#5').click
      end
      it { should have_content(p.problem) }
      it { should have_link find('#15',match: :prefer_exact).click }
  end
  
  describe "admin can manage rental" do
     FactoryGirl.create(:admin)
     #repair = FactoryGirl.create(:repair)
      before do
      fill_in :username, with: 'admin'
      fill_in :password, with: '123456789'
      click_on 'Login'
      find('#5').click
      find('#15',match: :prefer_exact).click
      end
  end

  
 
end