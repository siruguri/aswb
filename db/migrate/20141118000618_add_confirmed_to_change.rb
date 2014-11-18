class AddConfirmedToChange < ActiveRecord::Migration
  def change
    add_column :changes, :confirmed, :boolean
  end
end
