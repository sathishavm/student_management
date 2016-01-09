class Assignment < ActiveRecord::Base

	has_many :submissions
	belongs_to :training_class

	validates :training_class_id, :title, presence: true

	delegate :name, to: :training_class, prefix: true, allow_nil: true
end
