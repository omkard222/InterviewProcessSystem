class UsersController < ApplicationController

  def index
    @schedulers = Scheduler.all
    @employee_feedback = Scheduler.where(user_id: current_user.id)
  end



end
