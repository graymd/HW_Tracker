class CreateLocationCourses < ActiveRecord::Migration
  def change
    create_table :location_courses do |t|
      t.integer :location_id
      t.integer :course_id

      t.timestamps null: false
    end
  end
end
