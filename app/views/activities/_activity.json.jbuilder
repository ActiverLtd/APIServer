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
json.comments do
	json.partial! 'comments/comments', comments: activity.comments
end