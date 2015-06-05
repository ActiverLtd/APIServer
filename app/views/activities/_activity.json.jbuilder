json.extract! activity, :id, :from, :to, :created_at, :updated_at, :organizer, :comments, :participants, :participant_count, :required_level, :location_name
json.activity_type do
	json.partial! 'activity_types/activity_type', activity_type: activity.activity_type
end