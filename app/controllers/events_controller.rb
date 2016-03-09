class EventsController < ApplicationController
  def show
    @event = Event.find(1)
    @organizer = Organizer.first
    @task = Task.new
    @tasks = @organizer.tasks.order("end_date DESC")
  end
end