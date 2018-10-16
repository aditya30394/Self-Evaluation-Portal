class AddIndexToInstructorsEmail < ActiveRecord::Migration[5.1]
  def change
    add_index :instructors, :email, unique: true
  end
end
