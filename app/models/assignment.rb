class Assignment < ActiveRecord::Base
  
  has_many :submissions

  belongs_to :user
  accepts_nested_attributes_for :user

  has_many :users, through: :submissions

end
