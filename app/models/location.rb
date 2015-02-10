class Location < ActiveRecord::Base
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
  validates :open_date, presence: true

  has_many :location_courses
  has_many :courses, through: :location_courses

end
