class Organizer < ActiveRecord::Base
  has_many :events
  has_many :tasks, through: :events
  has_many :goals, through: :events
end
