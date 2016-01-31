class Event < ActiveRecord::Base
  belongs_to :organizer
  belongs_to :teacher
  has_many :tasks
end
