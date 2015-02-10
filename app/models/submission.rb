class Submission < ActiveRecord::Base
  
  belongs_to :assignment

  belongs_to :user
  accepts_nested_attributes_for :user
  has_many :comments, as: :commentable
end
