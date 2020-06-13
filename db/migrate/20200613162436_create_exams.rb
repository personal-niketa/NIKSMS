class CreateExams < ActiveRecord::Migration[5.2]
  def change
    create_table :exams do |t|
      t.references :batch, foreign_key: true
      t.references :school_class, foreign_key: true
      t.text :subject
      t.text :exam_name
      t.timestamps
    end
  end
end