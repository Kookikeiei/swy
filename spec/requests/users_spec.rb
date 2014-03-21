require 'spec_helper'
require 'simplecov'
SimpleCov.start 'rails'

describe 'log in' do
  before { visit root_path }
  subject { page }

  describe 'with invalid information' do
     user = FactoryGirl.create(:user)
   before do
      fill_in :username, with: user.username
      fill_in :password, with: user.password
      click_on 'Login'
    end
    it { should have_content(user.name) }
    it { should have_link find('#13').click }
  end

  describe "with invalid information" do
      before do
      fill_in :username, with: 'x'
      fill_in :password, with: 'x'
      click_on 'Login'
      end
      it { should have_content('Please enter valid information.') }
  end

  describe "with admin information" do
  	 FactoryGirl.create(:admin)
      before do
      fill_in :username, with: 'admin'
      fill_in :password, with: '123456789'
      click_on 'Login'
      end
      it { should have_content('Welcome back, admin!') }
      it { should have_link find('#6').click }
      it { should have_link find('#4').click }
      it { should have_link find('#5').click }
      it { should have_link find('#13').click }
  end

  describe "with admin information" do
    user = FactoryGirl.create(:user)
     FactoryGirl.create(:admin)
      before do
      fill_in :username, with: 'admin'
      fill_in :password, with: '123456789'
      click_on 'Login'
      find('#6').click
      fill_in 'Username', with: user.username
      fill_in 'Password', with: user.password
      fill_in 'Name', with: user.name
      fill_in 'Surname', with: user.surname
      fill_in 'Age', with: user.age
      fill_in 'Birth date',with: user.birth_date
      fill_in 'Personal',with: user.personal_id
      fill_in 'Address',with: user.address
      fill_in 'Phone',with: user.phone
      fill_in 'Email',with: user.email
      fill_in 'Rent',with: user.rent
      fill_in 'Room no',with: user.room_no
      click_on 'Save'
      end
      it { should have_content(user.name) }
     
  end

  describe "with admin information" do
     FactoryGirl.create(:admin)
      before do
      fill_in :username, with: 'admin'
      fill_in :password, with: '123456789'
      click_on 'Login'
      find('#4').click
      find('#9' , match: :prefer_exact).click
      fill_in 'Phone',with: '555555'
      click_on 'Save'
      end
      it { should have_content('555555') }
      
  end
 
end

