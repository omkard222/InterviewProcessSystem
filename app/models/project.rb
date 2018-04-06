class Project < ApplicationRecord
  belongs_to :dutable
  has_and_belongs_to_many :employees
  has_many :requirements, dependent: :destroy
  accepts_nested_attributes_for :requirements, reject_if: :all_blank, allow_destroy: true
end
