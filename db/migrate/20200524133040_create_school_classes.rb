class CreateSchoolClasses < ActiveRecord::Migration[5.2]
  def change
    create_table :school_classes do |t|
      t.text :class_name
      t.timestamps
    end
  end
end
