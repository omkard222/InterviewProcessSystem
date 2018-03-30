class AdminController < ApplicationController
  def index
  @emp =  Employee.all

  end
end
