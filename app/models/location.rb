class Location < ActiveRecord::Base
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
  validates :open_date, presence: true

end
