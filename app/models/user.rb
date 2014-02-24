class User < ActiveRecord::Base
  attr_accessible :address, :age, :birth_date, :email, :name, :phone, :password, :personal_id, :rent, :room_no, :surname, :username
  validates_presence_of :address, :age, :birth_date, :email, :name, :password, :personal_id, :rent, :room_no, :surname, :username
  validates :username, :length => { :in => 3..20 }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }
  validates_length_of :password, :in => 6..20
  
  def self.authenticate username, password
        @user = User.find_by_username username 
        if @user != nil
           if password == @user.password
            @user
           else
            nil
           end
        else
          nil
        end
  end
end
