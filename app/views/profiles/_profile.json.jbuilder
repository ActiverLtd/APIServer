json.extract! profile, :id, :name, :description, :picture, :born, :registered, :range, :rating_mean, :rating_count, :user_id, :created_at, :updated_at
json.is_direct profile.is_direct(current_user)
