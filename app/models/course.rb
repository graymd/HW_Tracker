class Course < ActiveRecord::Base
  validates :name, presence: true

  has_many :location_courses
  has_many :locations, through: :location_courses
end
