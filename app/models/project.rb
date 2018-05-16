class Project < ApplicationRecord
  resourcify
  belongs_to :dutable
  has_many :requirements
  has_and_belongs_to_many :employees
  has_many :requirements, dependent: :destroy
  belongs_to :user
  accepts_nested_attributes_for :requirements, reject_if: :all_blank, allow_destroy: true
end
