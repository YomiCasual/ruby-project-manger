class Project < ApplicationRecord
	belongs_to :user
	has_many :tasks




	def status
		return 'not-started' if tasks.none?
		if tasks.all? { |task| task.complete? }
			'completed'
		elsif tasks.any? { |task| task.in_progress? || task.complete? }
			'in-progress'
		else
			"not-started"
		end
	end

	def badge_color
		case status
			when 'not-started'
				'danger'
			when 'in-progress'
				'primary'
			when 'completed'
				'secondary'
		end
	end
	def percent_complete
		return 0 if tasks.none?
		complete_tasks = tasks.select { |task| task.complete?}.count
		((complete_tasks.to_f / tasks.count ) * 100).round
	end

	def total_complete
		return 0 if tasks.none?
		complete_tasks = tasks.select { |task| task.complete?}.count
	end
	# def total_count
	# 	return 0 if tasks.none?
	# 	complete_tasks = tasks.select { |task| task.complete?}.count
	# end
end
