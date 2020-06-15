class CreateQuestionPapers < ActiveRecord::Migration[5.2]
  def change
    create_table :question_papers do |t|
      t.references :exam, foreign_key: true
      t.string :question
      t.timestamps
    end
  end
end
