class AddAdminToLecturers < ActiveRecord::Migration[5.0]
  def change
    add_column :lecturers, :admin, :boolean, default: false
  end
end
