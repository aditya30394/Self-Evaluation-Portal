class CreateQuestionTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :question_types do |t|
      t.text :question_type

      t.timestamps
    end
  end
end
