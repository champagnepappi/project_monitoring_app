class AddRoleToLecturers < ActiveRecord::Migration[5.0]
  def change
    add_column :lecturers, :role, :integer
  end
end
