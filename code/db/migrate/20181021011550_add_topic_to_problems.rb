class AddTopicToProblems < ActiveRecord::Migration[5.1]
  def change
    remove_column :problems, :topic_id
    add_reference :problems, :topic, foreign_key: true
  end
end
