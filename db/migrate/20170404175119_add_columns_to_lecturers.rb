class AddColumnsToLecturers < ActiveRecord::Migration[5.0]
  def change
    add_column :lecturers, :first_name, :string
    add_column :lecturers, :last_name, :string
    add_column :lecturers, :email, :string
  end
end
