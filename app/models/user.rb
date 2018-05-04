class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_many :schedulers
  # def is_hr?
  #
  #   @user = User.find(params[:id])
  #   @user.designation
  # end

  # def is_employee?
  #   current_user.designation == 'Software Engineer'
  # end



  # def hr?
  #   has_role?(:HR)
  # end

  # def help
  #   puts 'hello'
  # end
end
