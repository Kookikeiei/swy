require 'spec_helper'

describe 'rental' do
  before { visit root_path }
  subject { page }

  describe 'user can see rental' do
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

  describe 'user see rental' do
     rental = FactoryGirl.create(:rental)
      user = FactoryGirl.create(:user)
   before do
      fill_in :username, with: user.username
      fill_in :password, with: user.password
      click_on 'Login'
      click_on 'Rental'
    end
      it { should have_content(rental.room_no) }
      it { should have_content(rental.rent) }
      it { should have_content(rental.name) }
      it { should have_content(rental.elec_unit) }
      it { should have_content(rental.water_unit) }
      it { should have_content(rental.unpay) }
      
   
  end


  describe "admin can manage rental" do
     FactoryGirl.create(:admin)
      before do
      fill_in :username, with: 'admin'
      fill_in :password, with: '123456789'
      click_on 'Login'
      click_on 'Member Information'
      end
      it { should have_link 'Rental' }
      it { should have_link 'Log out' }
  end


  
 
end