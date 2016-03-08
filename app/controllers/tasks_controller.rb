class TasksController < ApplicationController
  def create
    @organizer = Organizer.first
    @event = Event.find(1)
    @task = @organizer.tasks.new(task_params)

    if @task.save
      @task.update(
        start_date: Date.today,
        event: @event,
        title: "#{@event.name} - #{@organizer.first_name}: #{@task.end_date}"
      )
      redirect_to event_path(@event)
    else
      redirect_to event_path(@event), alert: "Tasks require a deadline and description."
    end
  end


  def index
    @tasks = Organizer.first.tasks
  end

  protected

  def task_params
    params.require(:task).permit(
      :end_date,
      :description
    )
  end

end
