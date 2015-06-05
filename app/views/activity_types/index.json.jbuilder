json.array!(@activity_types) do |activity_type|
	json.partial! 'activity_types/activity_type', activity_type: activity_type
end
