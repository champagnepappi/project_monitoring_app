class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.integer :supervisor_id
      t.integer :supervised_id

      t.timestamps
    end
    add_index :relationships, :supervisor_id
    add_index :relationships, :supervised_id
    add_index :relationships, [:supervisor_id, :supervised_id], unique: true
  end
end
