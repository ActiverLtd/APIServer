json.array!(@directs) do |direct|
	json.partial! 'profiles/profile', profile: direct.direct.profile
end
