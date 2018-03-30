class Project < ApplicationRecord
  belongs_to :dutable
  has_and_belongs_to_many :employees
end
