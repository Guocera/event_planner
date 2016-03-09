class Goal < ActiveRecord::Base
  belongs_to :event
  validates :end_date, :description, presence: true
end
