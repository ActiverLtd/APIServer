json.extract! comment, :id, :text, :created_at
json.user do
	json.partial! 'profiles/profile', profile: comment.user.profile
end
