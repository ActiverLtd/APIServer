json.array!(@activities) do |activity|
  json.extract! activity, :id, :from, :to, :activity_type_id, :organizer, :message
  json.url activity_url(activity, format: :json)
end
