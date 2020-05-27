class SchoolClass < ApplicationRecord
  belongs_to :school
  has_many :class_sections
end
