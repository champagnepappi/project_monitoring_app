class AddRememberDigestToLecturers < ActiveRecord::Migration[5.0]
  def change
    add_column :lecturers, :remember_digest, :string
  end
end
