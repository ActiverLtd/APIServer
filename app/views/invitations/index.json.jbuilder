json.array!(@invitations) do |invitation|
  json.extract! invitation, :id, :activity_id, :user_id, :accepted
  json.url invitation_url(invitation, format: :json)
end
