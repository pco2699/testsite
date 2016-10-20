class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_params

  def set_params
    unless @time_slot then
      @time_slot = TimeSlot.new
    end

    unless @time_slot_for_search then
      @time_slot_for_search = TimeSlot.ransack(params[:q])
    end
  end
end
