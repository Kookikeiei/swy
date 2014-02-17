require 'spec_helper'

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
    it { should have_link 'Log out' }
  end

  describe "with invalid information" do
      before do
      fill_in :username, with: 'x'
      fill_in :password, with: 'x'
      click_on 'Login'
      end
      it { should have_content('Please enter valid information.') }
      it { should have_content('Log in page')}
  end

  describe "with admin information" do
  	 FactoryGirl.create(:admin)
      before do
      fill_in :username, with: 'admin'
      fill_in :password, with: '123456789'
      click_on 'Login'
      end
      it { should have_content('Welcome back, admin!') }
      it { should have_link 'New User' }
      it { should have_link 'Log out' }
  end
 
end

