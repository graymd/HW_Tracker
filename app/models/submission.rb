class Submission < ActiveRecord::Base
  
  belongs_to :assignment

  belongs_to :user
  accepts_nested_attributes_for :user
  has_many :comments, as: :commentable
  has_many :links, dependent: :destroy

  include Workflow
  workflow do
    state :new do
      event :review, transitions_to: :reviewing
    end

    state :reviewing do
      event :complete, transitions_to: :completed
      event :incomplete, transitions_to: :incompleted
    end

    state :completed do
    end

    state :incompleted do
      event :review, transitions_to: :reviewing
    end
  end


end
