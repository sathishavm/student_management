class StudentsTrainingClass < ActiveRecord::Base

	belongs_to :student
	belongs_to :training_class
end
