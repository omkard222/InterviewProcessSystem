class UsersController < ApplicationController

  def index

    @schedulers = Scheduler.all

  end

  

end
