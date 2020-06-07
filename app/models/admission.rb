class Admission < ApplicationRecord
  before_save :create_admission_no	
  belongs_to :batch
  belongs_to :student
  belongs_to :class_section

  def create_admission_no
  	self.admission_number = rand(1000000)
  end

end
