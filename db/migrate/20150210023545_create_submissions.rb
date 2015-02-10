class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :workflow_state
      t.string :name
      t.text :input
      t.integer :assignment_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
