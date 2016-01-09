class TrainingClass < ActiveRecord::Base

	has_many :assignments
	has_many :students_training_classes
	has_many :students, through: :students_training_classes

	validates :name, presence: true
end
