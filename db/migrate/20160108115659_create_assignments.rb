class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.belongs_to :training_class, index: true
      t.string :title
      t.timestamps null: false
    end
  end
end
