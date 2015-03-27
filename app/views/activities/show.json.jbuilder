json.extract! @activity, :id, :from, :to, :activity_type_id, :message, :created_at, :updated_at, :comments, :participants
json.organizer @activity.organizer, :id, :email
#json.array!(@activity.participants) do |participant| #TODO: Fix the participants to only show id and profile
#    json.extract! participant, :id
#end