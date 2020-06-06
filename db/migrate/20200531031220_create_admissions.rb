class CreateAdmissions < ActiveRecord::Migration[5.2]
  def change
    create_table :admissions do |t|
      t.references :batch, foreign_key: true
      t.references :student, foreign_key: true
      t.references :class_section, foreign_key: true
      t.integer :roll_no
      t.timestamps
    end
  end
end
