class TasksController < ApplicationController
  def index
    @tasks = Organizer.first.tasks
  end
end
