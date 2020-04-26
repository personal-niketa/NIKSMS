class School < ApplicationRecord
  validates :school_name, :person_name, :contact_email, presence: true
  validates :contact_number, length: { maximum: 12, minimum:10 }, numericality: { only_integer: true }, presence: true
end
