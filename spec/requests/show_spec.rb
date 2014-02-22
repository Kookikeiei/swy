require 'spec_helper'

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
      it { should have_link 'Rental' }
      it { should have_link 'Tenant Information' }
      it { should have_link 'Repair Notification' }
   
  end

  describe 'user see information' do
     user = FactoryGirl.create(:user)
   before do
      fill_in :username, with: user.username
      fill_in :password, with: user.password
      click_on 'Login'
      click_on 'Tenant Information'
    end
      it { should have_content(user.name) }
      it { should have_content(user.birth_date) }
      it { should have_content(user.address) }
      it { should have_content(user.email) }
      it { should have_content(user.room_no) }
      
   
  end


  describe "admin information" do
     FactoryGirl.create(:admin)
      before do
      fill_in :username, with: 'admin'
      fill_in :password, with: '123456789'
      click_on 'Login'
      end
      it { should have_content('Welcome back, admin!') }
      it { should have_link 'New User' }
      it { should have_link 'Member Information' }
      it { should have_link 'Repair Notification' }
      it { should have_link 'Log out' }
  end


  
 
end