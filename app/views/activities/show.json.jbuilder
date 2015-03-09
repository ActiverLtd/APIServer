json.extract! @activity, :id, :from, :to, :activity_type_id, :message, :created_at, :updated_at, :comments
json.organizer @activity.organizer, :id, :email
json.participants @activity.participants, :id, :email