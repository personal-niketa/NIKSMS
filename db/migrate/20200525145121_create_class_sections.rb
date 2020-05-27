class CreateClassSections < ActiveRecord::Migration[5.2]
  def change
    create_table :class_sections do |t|
      t.string :section_name
      t.text :description
      t.references :school_class, index: true
      t.timestamps
    end
  end
end