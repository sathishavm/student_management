class CreateTrainingClasses < ActiveRecord::Migration
  def change
    create_table :training_classes do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
