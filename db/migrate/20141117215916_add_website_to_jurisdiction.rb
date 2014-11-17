class AddWebsiteToJurisdiction < ActiveRecord::Migration
  def change
    add_column :jurisdictions, :website, :string
  end
end
