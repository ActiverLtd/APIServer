# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :activity_show do
    user_id 1
    activity_id 1
    accepted false
  end
end
