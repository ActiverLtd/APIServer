json.array!(@suggestions) do |suggestion|
  json.extract! suggestion, :id, :activity_id, :status
  json.user suggestion.user, :id, :email
end
