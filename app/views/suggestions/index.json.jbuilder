json.array!(@suggestions) do |suggestion|
	json.extract! suggestion, :id, :status
	json.user do
		json.partial! 'profiles/profile', profile: suggestion.user.profile
	end
	json.activity do
		json.partial! 'activities/activity', activity: suggestion.activity
	end
end
