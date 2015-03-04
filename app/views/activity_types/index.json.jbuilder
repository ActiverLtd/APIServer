json.array!(@activity_types) do |activity_type|
  json.extract! activity_type, :id, :name
end
