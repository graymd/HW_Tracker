class LocationCourseUser < ActiveRecord::Base
  belongs_to :location_course
  belongs_to :user
  accepts_nested_attributes_for :user
end
