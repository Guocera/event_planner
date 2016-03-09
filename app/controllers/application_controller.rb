class ApplicationController < ActionController::Base
  add_flash_types :task_alert, :task_notice, :goal_alert, :goal_notice

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

end
