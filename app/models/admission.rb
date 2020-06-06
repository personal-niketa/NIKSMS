class Admission < ApplicationRecord
  belongs_to :batch
  belongs_to :student
  belongs_to :class_section
end
