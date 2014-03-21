require 'spec_helper'
require 'simplecov'
SimpleCov.start 'rails'

describe 'show application' do
  before { visit root_path }
  subject { page }

  describe 'user can see details' do
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

  describe 'user see information' do
     user = FactoryGirl.create(:user)
   before do
      fill_in :username, with: user.username
      fill_in :password, with: user.password
      click_on 'Login'
      find('#1').click
    end
      it { should have_content(user.name) }
      it { should have_content(user.birth_date) }
      it { should have_content(user.address) }
      it { should have_content(user.room_no) }
      
   
  end


  describe "admin information" do
     FactoryGirl.create(:admin)
      before do
      fill_in :username, with: 'admin'
      fill_in :password, with: '123456789'
      click_on 'Login'
      end
      it { should have_link find('#6').click }
      it { should have_link find('#4').click }
      it { should have_link find('#5').click }
      it { should have_link find('#13').click }
  end


  
 
end