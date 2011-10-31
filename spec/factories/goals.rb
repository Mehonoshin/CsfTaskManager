# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :goal do
    user_id 1
    title "MyString"
    note "MyString"
  end
end
