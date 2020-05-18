class School < ApplicationRecord
  validates :school_name, presence: true
  resourcify

  has_many :users
end
