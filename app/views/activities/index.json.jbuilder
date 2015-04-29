json.array!(@activities) do |activity|
  json.extract! activity, :id, :from, :to, :activity_type_id, :distance, :organizer, :required_level, :participant_count, :location_name
  json.participants activity.participants.size
end
