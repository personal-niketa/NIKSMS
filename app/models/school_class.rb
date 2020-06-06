class SchoolClass < ApplicationRecord
  belongs_to :school
  has_many :class_sections

  def get_sections_by_name
    sections = ""
    self.class_sections.each do |sec|
      sections = [sections, sec.section_name].join(' ')
    end
    sections
  end
end