json.array!(@profiles) do |profile|
  json.extract! profile, :id, :name, :description, :picture, :born, :registered, :range, :rating_mean, :rating_count, :user_id
  json.url profile_url(profile, format: :json)
end
