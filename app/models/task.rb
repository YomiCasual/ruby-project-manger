class Task < ApplicationRecord
  belongs_to :project

  validates :status, inclusion: { in: ['not-started', 'in-progress', 'completed'] }

  STATUS_OPTIONS = [
    ["Not Started", "not-started"],
    ["In porgress", "in-progress"],
    ['Completed', 'completed'],
  ]

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
  
  def badge_text
	case status
	when 'not-started'
		'Not Started'
	when 'in-progress'
		'In Progress'
	when 'completed'
		'Completed'
	end
  end

  def complete?
	status === 'completed'
  end
  def in_progress?
	status === 'in-progress'
  end
  def not_started?
	status === 'not-started'
  end
end
