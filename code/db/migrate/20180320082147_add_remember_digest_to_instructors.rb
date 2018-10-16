class AddRememberDigestToInstructors < ActiveRecord::Migration[5.1]
  def change
    add_column :instructors, :remember_digest, :string
  end
end
