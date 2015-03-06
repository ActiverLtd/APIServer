FactoryGirl.define do
	factory :comment do
		text "MyString"
		writer 1
	end
	factory :suggestion do
		activity_id 1
		user_id 1
		accepted false
	end

	factory :user do
		sequence :email do |n|
			"person#{n}@example.com"
		end
		password "abcdefghijklmnopqestuvw"
	end
end