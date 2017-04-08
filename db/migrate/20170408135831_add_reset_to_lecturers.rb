class AddResetToLecturers < ActiveRecord::Migration[5.0]
  def change
    add_column :lecturers, :reset_digest, :string
    add_column :lecturers, :reset_sent_at, :datetime
  end
end
