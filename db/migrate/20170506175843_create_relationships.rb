class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.integer :supervisor_id
      t.integer :supervised_id

      t.timestamps
    end
  end
end
