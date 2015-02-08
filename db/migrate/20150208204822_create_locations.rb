class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zip_code
      t.date :open_date

      t.timestamps null: false
    end
  end
end
