class EventsController < ApplicationController
  def show
    @event = Event.find(1)
    @task = Organizer.first.tasks.new
  end
end