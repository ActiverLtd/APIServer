json.array!(@activities) do |activity|
  json.extract! activity, :id, :from, :to, :activity_type_id, :message
  json.organizer activity.organizer, :id #TODO: include activity.profile.name here along with other necessary details
end
