class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         def admin?
            has_role?(:admin)
        end

        def hr?
          has_role?(:HR)
        end

        def help
          puts 'hello'
        end
end
