# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :activity do
    from "2014-10-10 21:12:28"
    to "2014-10-10 21:12:28"
    activity_type_id 1
    organizer 1
    message "MyText"
  end
end
