class Batch < ApplicationRecord
  has_many :admissions
  has_many :students, through: :admissions
end
