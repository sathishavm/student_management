class CreateStudentsTrainingClasses < ActiveRecord::Migration
  def change
    create_table :students_training_classes do |t|
      t.belongs_to :student, index: true
      t.belongs_to :training_class, index: true
      t.timestamps null: false
    end
  end
end
