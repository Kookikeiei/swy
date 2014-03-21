require 'spec_helper'
require 'simplecov'
SimpleCov.start 'rails'

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
      it { should have_link find('#1').click }
      it { should have_link find('#2').click }
      it { should have_link find('#3').click }
   
  end

  describe 'user see rental' do
     rental = FactoryGirl.create(:rental)
      user = FactoryGirl.create(:user)
   before do
      fill_in :username, with: user.username
      fill_in :password, with: user.password
      click_on 'Login'
      find('#1').click
    end
      it { should have_content(rental.room_no) }
      it { should have_content(rental.rent) }
      it { should have_content(rental.name) }
      it { should have_content(rental.elec_unit) }
      it { should have_content(rental.water_unit) }
      it { should have_content(rental.unpay) }
      
   
  end

  describe 'user see rental' do
     rental = FactoryGirl.create(:rental)
      user = FactoryGirl.create(:user)
   before do
      fill_in :username, with: user.username
      fill_in :password, with: user.password
      click_on 'Login'
      find('#1').click
      find('#16').click
    end
      it { should have_link find('#16').click }
      
      
   
  end


  describe "admin can manage rental" do
     FactoryGirl.create(:admin)
      before do
      fill_in :username, with: 'admin'
      fill_in :password, with: '123456789'
      click_on 'Login'
      find('#4').click
      end
      it { should have_link find('#7', match: :prefer_exact).click }
      it { should have_link find('#13').click }
  end

  describe "admin can manage rental" do
     FactoryGirl.create(:admin)
      before do
      fill_in :username, with: 'admin'
      fill_in :password, with: '123456789'
      click_on 'Login'
      find('#4').click
      find('#8',match: :prefer_exact).click
      find('#16').click
      fill_in :unpay, with: '123456789'
      click_on 'Save'
      end
     it { should have_content('123456789') }
  end
  
 
end