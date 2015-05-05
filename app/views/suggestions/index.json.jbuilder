json.array!(@suggestions) do |suggestion|
	json.extract! suggestion, :id, :status
	json.user suggestion.user, :id, :email
	json.activity do
		json.partial! 'activities/activity', activity: suggestion.activity
	end
end
