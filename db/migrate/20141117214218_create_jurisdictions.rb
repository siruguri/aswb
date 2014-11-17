class CreateJurisdictions < ActiveRecord::Migration
  def change
    create_table :jurisdictions do |t|
      t.string :name
      t.string :address
      t.text :exempted_groups
      t.text :ce_requirements_info
      t.text :definitions

      t.timestamps
    end
  end
end
