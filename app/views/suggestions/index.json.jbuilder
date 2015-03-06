json.array!(@suggestions) do |suggestion|
  json.extract! suggestion, :id, :activity_id, :user_id, :accepted
  json.url suggestion_url(suggestion, format: :json)
end
