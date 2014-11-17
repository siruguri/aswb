class AddOwnerIdToJurisdiction < ActiveRecord::Migration
  def change
    add_column :jurisdictions, :owner_id, :integer
  end
end
