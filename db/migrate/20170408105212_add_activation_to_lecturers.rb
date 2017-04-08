class AddActivationToLecturers < ActiveRecord::Migration[5.0]
  def change
    add_column :lecturers, :activation_digest, :string
    add_column :lecturers, :activated, :boolean, default: false
    add_column :lecturers, :activated_at, :datetime
  end
end
