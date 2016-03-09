class GoalsController < ApplicationController
  def create
    @organizer = Organizer.first
    @event = Event.find(1)
    @goal = @organizer.goals.new(goal_params)

    if @goal.save
      @goal.update(
        start_date: Date.today,
        event: @event,
        title: "Deadline: #{@goal.end_date.to_date} : Assigned to: #{@organizer.first_name}"
      )
      redirect_to event_path(@event)
    else
      redirect_to event_path(@event), alert: "Goals require a deadline and description."
    end
  end

  def destroy
    @goal = Goal.find(params[:id])
    @event = Event.find(1)
    @goal.destroy
    redirect_to event_path(@event), notice: "Goal was successfully deleted."
  end

  protected

  def goal_params
    params.require(:goal).permit(
      :end_date,
      :description
    )
  end

end
