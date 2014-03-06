require 'spec_helper'

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
      it { should have_link 'Rental' }
      it { should have_link 'Tenant Information' }
      it { should have_link 'Repair Notification' }
   
  end

  describe 'user can add repair problem' do
      user = FactoryGirl.create(:user)
   before do
      fill_in :username, with: user.username
      fill_in :password, with: user.password
      click_on 'Login'
      click_on 'Repair Notification'
      fill_in :text, with: "The bathroom has problem"
      fill_in :username, with: user.username
      fill_in :room_no, with: user.room_no
      click_on 'Post problem'
    end
      it { should have_content("Problem") }
      it { should have_content("Room no") }
      it { should have_content("Name") }
      it { should have_link 'Remove problem' }
      
   
  end


  describe "admin can manage rental" do
     FactoryGirl.create(:admin)
     #repair = FactoryGirl.create(:repair)
      before do
      fill_in :username, with: 'admin'
      fill_in :password, with: '123456789'
      click_on 'Login'
      click_on 'Repair Notification'
      end
      it { should have_content("Problem") }
      it { should have_content("Room no") }
      it { should have_content("Name") }
      it { should have_link 'Remove problem' }
      it { should have_link 'Seen and Fixing' }
  end


  
 
end