class CreateChanges < ActiveRecord::Migration
  def change
    create_table :changes do |t|
      t.text :changed_val
      t.string :changed_by
      t.string :changed_key
      t.string :change_type
      t.integer :jurisdiction_id

      t.timestamps
    end
  end
end
