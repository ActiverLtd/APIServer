json.activities @activities do |activity|
	json.partial! 'activities/activity', activity: activity
	json.suggestions activity.suggestions do |suggestion|
		json.extract! suggestion, :id, :status
	end
end