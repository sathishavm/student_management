class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.belongs_to :student, index: true
      t.belongs_to :assignment, index: true
      t.text :result
      t.timestamps null: false
    end
  end
end
