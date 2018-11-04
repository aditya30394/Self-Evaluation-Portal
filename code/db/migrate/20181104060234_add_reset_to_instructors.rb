class AddResetToInstructors < ActiveRecord::Migration[5.1]
  def change
    add_column :instructors, :reset_digest, :string
    add_column :instructors, :reset_sent_at, :datetime
  end
end
