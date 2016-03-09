class TasksController < ApplicationController
  def create
    @organizer = Organizer.first
    @event = Event.find(1)
    @task = @organizer.tasks.new(task_params)

    if @task.save
      @task.update(
        start_date: Date.today,
        event: @event,
        title: "Deadline: #{@task.end_date.to_date} : Assigned to: #{@organizer.first_name}"
      )
      redirect_to event_path(@event)
    else
      redirect_to event_path(@event), alert: "Tasks require a deadline and description."
    end
  end

  def show
    @organizer = Organizer.first
    @task = Task.find(params[:id])
  end

  def index
    @organizer = Organizer.first
    @tasks = @organizer.tasks
  end

  protected

  def task_params
    params.require(:task).permit(
      :end_date,
      :description
    )
  end

end
