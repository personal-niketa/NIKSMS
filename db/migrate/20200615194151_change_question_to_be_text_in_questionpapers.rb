class ChangeQuestionToBeTextInQuestionpapers < ActiveRecord::Migration[5.2]
  def change
    change_column :question_papers, :question, :text
  end
end
