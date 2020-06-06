class Student < ApplicationRecord
  has_many :admissions, dependent: :destroy
  has_many :batches, through: :admissions
end