class GoalsController < ApplicationController
  def create
    @organizer = Organizer.first
    @event = Event.find(1)
    @goal = @organizer.goals.new(goal_params)

    if @goal.save
      @goal.update(
        start_date: Date.today,
        event: @event,
        status: "Incomplete",
        title: "Deadline: #{@goal.end_date.to_date} : Assigned to: #{@organizer.first_name}"
      )
      redirect_to event_path(@event)
    else
      redirect_to event_path(@event)
    end
  end

  def destroy
    @goal = Goal.find(params[:id])
    @event = Event.find(1)
    @goal.destroy
    redirect_to event_path(@event)
  end

  def update
    @goal = Goal.find(params[:id])
    @event = Event.find(1)

    puts("change: ", params[:change])
    case params[:change]
    when "Incomplete"
      @goal.update(status: "Incomplete")
    when "In Progress"
      @goal.update(status: "In Progress")
    when "Completed"
      @goal.update(status: "Complete")
    end

    redirect_to event_path(@event)
  end

  protected

  def goal_params
    params.require(:goal).permit(
      :end_date,
      :description
    )
  end

end
