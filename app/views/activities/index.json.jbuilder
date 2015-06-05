json.array!(@activities) do |activity|
	json.extract! :distance
	json.partial! 'activities/activity', activity: activity
end
