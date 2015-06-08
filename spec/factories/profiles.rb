# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	factory :profile do
		name "MyString"
		description "MyText"
		picture "MyString"
		born "2014-10-10"
		registered "2014-10-10 16:55:25"
		rating_mean 1.5
		rating_count 1
		user_id 1
	end
end
