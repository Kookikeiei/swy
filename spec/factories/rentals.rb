# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :rental do
    room_no "MyString"
    rent "MyString"
    name "MyString"
    elec_unit "MyString"
    water_unit "MyString"
    unpay "MyString"
  end
end
