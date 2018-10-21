class AddQuestionTypeToProblems < ActiveRecord::Migration[5.1]
  def change
    add_reference :problems, :question_type, foreign_key: true
  end
end
