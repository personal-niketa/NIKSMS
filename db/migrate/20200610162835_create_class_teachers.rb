class CreateClassTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :class_teachers do |t|
      t.references :batch, foreign_key: true
      t.references :class_section, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end