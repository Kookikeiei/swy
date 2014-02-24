# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "MyString"
    surname "MyString"
    age "MyString"
    birth_date "MyString"
    personal_id "MyString"
    address "MyString"
    phone "08979999"
    email "myd@hotmail.com"
    rent "MyString"
    room_no "MyString"
    username "MfySdftring"
    password "MyString"
  end

  factory :admin,class: User do
    name "MyString"
    surname "MyString"
    age "MyString"
    birth_date "MyString"
    personal_id "MyString"
    address "MyString"
    email "myd@hotmail.com"
    phone "08979999"
    rent "MyString"
    room_no "MyString"
    username "admin"
    password "123456789"
  end
end



