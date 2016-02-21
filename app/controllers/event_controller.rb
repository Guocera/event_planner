class EventController < ApplicationController
  def show
    @event = Event.find(1)
  end
end
