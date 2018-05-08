class User < ApplicationRecord
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :schedulers
   cattr_accessor :current_role
  # def is_hr?
  #
  #   @user = User.find(params[:id])
  #   @user.designation
  # end

  # def is_employee?
  #   current_user.designation == 'Software Engineer'
  # end



  def hr?
    has_role?(:hr)
  end

  def manager?
    has_role?(:manager)
  end

  def any?
    has_role?(:team_member)
  end

end
