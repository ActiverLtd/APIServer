json.extract! activity, :id, :from, :to, :created_at, :updated_at, :participant_count, :required_level, :location_name
json.activity_type do
	json.partial! 'activity_types/activity_type', activity_type: activity.activity_type
end
json.organizer do
	json.partial! 'profiles/profile', profile: activity.organizer.profile
end
json.participants do
	json.partial! 'profiles/profiles', users: activity.participants
end
json.comments activity.comments do |comment|
	json.extract! comment, :id, :text, :created_at
	json.author comment.user.profile.name
end