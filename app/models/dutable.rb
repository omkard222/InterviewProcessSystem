class Dutable < ApplicationRecord
  resourcify
  has_many :projects, dependent: :destroy
  accepts_nested_attributes_for :projects, reject_if: :all_blank, allow_destroy: true
end
