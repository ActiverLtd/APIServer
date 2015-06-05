json.array!(@activities) do |activity|
	json.extract! activity, :distance
	json.partial! 'activities/activity', activity: activity
end
