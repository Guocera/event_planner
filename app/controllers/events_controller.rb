class EventsController < ApplicationController
  def show
    @event = Event.find(1)
    @organizer = Organizer.first

    @task = Task.new
    @tasks = @organizer.tasks.order("end_date DESC")

    @goal = Goal.new
    @goals = @organizer.goals.order("end_date ASC")
  end
end