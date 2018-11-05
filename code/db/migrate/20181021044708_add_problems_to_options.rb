class AddProblemsToOptions < ActiveRecord::Migration[5.1]
  def change
    add_reference :options, :problem, foreign_key: true
  end
end
