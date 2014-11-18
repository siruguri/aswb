class AddPracticeInfoIdToChange < ActiveRecord::Migration
  def change
    add_column :changes, :practice_info_id, :integer
  end
end
