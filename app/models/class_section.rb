class ClassSection < ApplicationRecord

  belongs_to :school_class

  # def get_user_by_role
  #   sections = ""
  #   self.class_sections.each do |sec|
  #     sections = [sections, sec.section_name].join(' ')
  #   end
  #   sections
  # end
  
end