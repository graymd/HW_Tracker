class LocationCourse < ActiveRecord::Base
  belongs_to :course
  belongs_to :location
  has_many :location_course_users
  has_many :users, through: :location_course_users
end
