class RemoveCourseTakenFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :course_taken, :string
  end
end
