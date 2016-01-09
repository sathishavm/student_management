class Student < ActiveRecord::Base

	has_many :students_training_classes
	has_many :training_classes, through: :students_training_classes
	has_many :assignments, through: :training_classes
	has_many :submissions
	has_many :closed_assignments, source: :assignment, through: :submissions

	validates :name, :email, presence: true
	validates_email_format_of :email

	def open_assignments
		assignments.joins("left outer join submissions on assignments.id=submissions.assignment_id and submissions.student_id=#{self.id}").where('submissions.student_id is null')
	end
end