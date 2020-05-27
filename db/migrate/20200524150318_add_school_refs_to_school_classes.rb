class AddSchoolRefsToSchoolClasses < ActiveRecord::Migration[5.2]
  def change
    add_reference :school_classes, :school, index: true
  end
end