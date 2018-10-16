class AddActivatedToInstructors < ActiveRecord::Migration[5.1]
  def change
    add_column :instructors, :activated, :boolean
  end
end
