class AddProblemsToOptions < ActiveRecord::Migration[5.1]
  def change
    add_reference :options, :questions, foreign_key: true
  end
end
