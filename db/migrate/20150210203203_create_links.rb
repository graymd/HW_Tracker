class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.text :url
      t.integer :submission_id

      t.timestamps null: false
    end
  end
end
