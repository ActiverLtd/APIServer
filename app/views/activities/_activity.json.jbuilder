json.extract! activity, :id, :from, :to, :created_at, :updated_at, :comments, :participant_count, :required_level, :location_name
json.activity_type json.partial! 'activity_types/activity_type', activity_type: activity.activity_type
json.organizer json.partial! 'profiles/profile', profile: activity.organizer.profile
json.participants json.partial! 'profiles/profiles', users: activity.participants